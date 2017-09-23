#!/bin/bash


# Git commit and push PHP clients
# e.g. example_git_clone example-tests
example_git_clone() {
	echo "example_git_clone"
	
	local repository=$1
	local branch=$(getvalue org.example.branch)
	local gitUser=$(getvalue org.example.atlassian.user)
	local gitEmail=$(getvalue org.example.atlassian.email)
	local gitToken=$(getvalue org.example.atlassian.token)
	local gitUrl="$(getvalue org.example.atlassian.bitbucket.baseUrl)/$repository.git"
	local atlassianBasicAuth=$(getvalue org.example.atlassian.basic)
	
	git config --global user.name "$gitUser"
	git config --global user.email "$gitEmail"
	
	# Git Checkout new branch
	isBranchExisting=$(git ls-remote --heads "$gitUrl" "$branch" | wc -l)
	echo "branch existing: $isBranchExisting"
	if [[ $isBranchExisting -eq 1 ]]
	then
		# clone existing branch
		echo "using existing branch $branch in $gitUrl"
		git clone -b "$branch" --single-branch "$gitUrl"
	else
		# create branch
		echo "creating new branch $branch in $gitUrl"
		git clone -b master "$gitUrl"
		cd $repository
		git checkout -b "$branch"
		cd ..
	fi
}

# Git commit and push
example_git_push() {
	echo "example_git_push"

	local repository=$1
	local commitMessage=$2
	local branch=$(getvalue org.example.branch)
	local gitUser=$(getvalue org.example.atlassian.user)
	local gitEmail=$(getvalue org.example.atlassian.email)
	
	git config --global user.name "$gitUser"
	git config --global user.email "$gitEmail"
	
	# Git add, commit and push
	cd $repository
	echo "Cloud build triggered $(date +'%d/%m/%Y - %H:%M:%S:%3N') ( $(date +%s) )" >> build.timestamp
	git add .
	git commit -m "$commitMessage ($formattedDateTime)"
	git push -u -f origin $branch
	cd ..
}

# run maven build whole project
example_maven_build() {
	echo "example_maven_build"
	
	local folder=$1
	local version=$(getvalue org.example.build.version)
	
	cd $folder
	
	# change version for all parent projects and their children
	mvn versions:update-child-modules versions:set -DnewVersion="$version" -q
	cd parent.service
	mvn versions:update-child-modules versions:set -DnewVersion="$version" -q
	cd ..
	cd parent.lib
	mvn versions:update-child-modules versions:set -DnewVersion="$version" -q
	cd ..
	cd parent.grpc
	mvn versions:update-child-modules versions:set -DnewVersion="$version" -q
	cd ..
	
	#mvn dependency:purge-local-repository
	mvn clean install -U -q -fae -Pdocu
	# -Dversion="$version"
	
	cd ..

	# copy some generated build artifacts into common 'build-artifacts' folder
	mkdir -p build-artifacts
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		mkdir -p build-artifacts/$artifact
		#cd $folder/$artifact
		#echo "artifact-folder $artifact: $(ls -a)"
		#cd target
		#echo "target-folder $artifact: $(ls -a)"
		#cd ../../..
		cp $folder/$artifact/target/*.* build-artifacts/$artifact/.
		cp $folder/$artifact/Dockerfile build-artifacts/$artifact/Dockerfile
	done < services.yaml
}

# run maven tests against deployed cluster
example_maven_test() {
	echo "example_maven_test"
	
	local folder=$1
	local isRunTest=$(getvalue org.example.test)
	local cluster=$(getvalue org.example.cluster)
	local namespace=$(getvalue org.example.namespace)
	local ingressIp=$(getvalue org.example.ip)

	if [ $isRunTest == true ]
	then
		cd $folder
		
		# Integration tests
		mvn verify -U -q -fae -Pitest-remote -Dorg.example.host=$ingressIp
		
		# Performance tests
		mvn verify -U -q -fae -Pptest-remote -Dorg.example.host=$ingressIp
		cd ..
		
		mkdir -p build-artifacts/_tests
		
		cp -r $folder/target/* build-artifacts/_tests/.
	else
		echo "Skipping tests is enabled"
	fi
}

# TODO: trigger tests
example_python_test() {
	echo "example_python_test"
	
	local folder=$1
	
	# cd $folder
	# python test.py
}

# build docker images for each sub project (services.yaml)
example_docker_build() {
	echo "example_docker_build"
	
	local folder=$1
	local imageRegistry=$2
	local imageVersion=$(getvalue org.example.image.version)
	
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		cd $folder/$artifact
		docker build -q -t "$imageRegistry/$artifact:$imageVersion" .
		cd ../..
	done < services.yaml
}

# push docker images to gcr.io registry for each sub project (services.yaml)
example_docker_push() {
	echo "example_docker_push"
	
	local folder=$1
	local imageRegistry=$2
	local imageVersion=$(getvalue org.example.image.version)
	
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		docker push "$imageRegistry/$artifact:$imageVersion"
	done < services.yaml
}

# clean up docker registry
example_docker_cleanup() {
	echo "example_deploy"
	
	local imageRegistry=$(getvalue org.example.image.registry)
	
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		image="$imageRegistry/$artifact"
		for digest in $(gcloud container images list-tags $image --limit=999999 --filter "dangling=true" --format='get(digest)')
		do
		    gcloud container images delete -q --force-delete-tags "${image}@${digest}"
		done
	done < services.yaml
}

# deploy into cluster
example_deploy() {
	echo "example_deploy"
	
	local cluster=$(getvalue org.example.cluster)
	local zone=$(getvalue org.example.zone)
	local googleProject=$(getvalue org.example.projectId)
	local useHelm=$(getvalue org.example.usehelm)
	
	# create cluster if not existing
	#gcloud beta container --project "$googleProject" clusters create "$cluster" --zone "$zone" --username="admin" --cluster-version "1.7.5" --machine-type "n1-standard-2" --image-type "COS" --disk-size "100" --scopes "https://www.googleapis.com/auth/compute","https://www.googleapis.com/auth/devstorage.full_control","https://www.googleapis.com/auth/sqlservice.admin","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "2" --network "default" --enable-cloud-logging --enable-cloud-monitoring --enable-legacy-authorization --enable-autorepair
	
	if [ $useHelm == true ]
	then
		example_deploy_helm
	else
		example_deploy_kubectl
	fi
}

# use kubectl to deploy into cluster
example_deploy_kubectl() {
	echo "example_deploy_kubectl"
	
	local namespace=$(getvalue org.example.namespace)
	
	kubectl apply -f build-artifacts/manifests --namespace="$namespace"	
}

# use helm chart/release or kubectl create/apply to deploy into cluster
example_deploy_helm() {
	echo "example_deploy_helm"
	
	local chartName=$(getvalue org.example.chart)
	local releaseName=$(getvalue org.example.release)
	local namespace=$(getvalue org.example.namespace)
	local googleProjectId=$(getvalue org.example.projectId)
	local clusterName=$(getvalue org.example.cluster)
	local zone=$(getvalue org.example.zone)
	
	gcloud container clusters get-credentials "$clusterName" --zone "$zone" --project "$googleProjectId"
	
	cd helm
	
	#gcloud config set container/use_application_default_credentials true
	
	helm init --debug
	echo "helm: initialized"
	
	helm version --debug
	echo "helm: version verified"
	
	helm lint --debug "./$chartName"
	echo "helm: $chartName linted"
	
	helm package --debug "./$chartName"
	echo "helm: $chartName packaged"
	
	# check if previous deployment is existing.
	existingRelease=$(helm get "$releaseName" 2>&1)
	rc=$?
	if [[ $rc != 0 ]]
	then
		echo "helm: installing new release $releaseName"
	    helm install --name="$releaseName" --namespace="$namespace" --debug ./example
	    echo "helm: new release $releaseName installed"
	else
		echo "helm: upgrading existing release $releaseName"
	    helm upgrade "$releaseName" --force --recreate-pods --debug ./example
	    echo "helm: existing release $releaseName upgraded"
	fi
	
	helm ls
	echo "helm: $releaseName release verified"
	cd ..
	
	#helm serve --repo-path ./helm; exit;
	
	ingressIp=$(kubectl get ingress example.gateway --namespace="$namespace" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
	echo "org.example.ip=$ingressIp" >> deploy.properties
	#echo "org.example.ip=UNKNOWN" >> deploy.properties
}

example_report() {
	echo "example_report"
	
	local folder=$1
	
	example_report_html
	example_report_jira
	example_report_confluence
	example_report_hipchat
	example_report_dns
	example_report_helm_repo
	
	example_report_copy
}

# create jira comment for stakeholder
example_report_jira() {
	echo "example_report_jira"

	local jiraIssueId=$(getvalue org.example.jira.issueId)
	local atlassianBaseUrl=$(getvalue org.example.atlassian.baseUrl)
	local atlassianBasicAuth=$(getvalue org.example.atlassian.basic)
	local assignee=$(getvalue org.example.jira.assignee)
	local reporter=$(getvalue org.example.jira.reporter)
	local creator=$(getvalue org.example.jira.creator)
	
	echo "{ \"body\": \"Hi [~$creator], \n Hi [~$reporter], \n Hi [~$assignee], \n This issue has been successfully deployed into cluster \n *'$(getvalue org.example.cluster)'* \n under the namespace \n *'$(getvalue org.example.namespace)'* \n \" }" > comment.json
	curl -i \
	-H "Accept: application/json" \
	-H "Authorization: Basic $atlassianBasicAuth" \
	-H "Content-Type:application/json" \
	-d "$(cat comment.json)" "$atlassianBaseUrl/rest/api/2/issue/$jiraIssueId/comment"
}

# find hipchat-usernames of stakeholders and message them
# see https://www.hipchat.com/docs/apiv2/auth
# get token from: https://www.hipchat.com/account/api
# token 1234
# first get token: curl POST https://example.hipchat.com/v2/oauth/token
# then curl POST https://example.hipchat.com/v2/user/tester@exampleorg/message
example_report_hipchat() {
	echo "example_report_hipchat"
	
	local release=$(getvalue org.example.release)
	local namespace=$(getvalue org.example.namespace)
	local cluster=$(getvalue org.example.cluster)
	local hipchatToken=$(getvalue org.example.hipchat.token)
	local jiraAssigneeEmail=$(getvalue org.example.atlassian.assignee.email)
	
	echo "{ \"message\": \"Successfully deployed release: $release \n - namespace: $namespace \n -cluster: $cluster.\" }" > message.json
	sed 's/\\"/\"/g' message.json
	curl -H "Content-Type:application/json" \
	-X POST -d "$(cat message.json)" "$hipchatBaseUrl/user/$jiraAssigneeEmail/message?auth_token=$hipchatToken"
}

# generate confluence report
example_report_confluence() {
	echo "example_report_confluence"
	
	local atlassianBaseUrl=$(getvalue org.example.atlassian.baseUrl)
	local atlassianBasicAuth=$(getvalue org.example.atlassian.basic)
	
	# confluence page IDs of the three clusters
	local clusterDevelopPageId=84935122
	local clusterTestingPageId=85033510
	local clusterStagingPageId=82051091
	local clusterReleasePageId=-1
	local clusterNightlyPageId=84935122
	local clusterPageId=$clusterStagingPageId

	case "$(getvalue org.example.cluster)" in
	"example-cluster-develop")
	    clusterPageId=$clusterDevelopPageId
	    ;;
	"example-cluster-testing")
	    clusterPageId=$clusterTestingPageId
	    ;;
	"example-cluster-staging")
	    clusterPageId=$clusterStagingPageId
	    ;;
	"example-cluster-nightly")
	    clusterPageId=$clusterNightlyPageId
	    ;;
	"example-cluster-release")
	    clusterPageId=$clusterReleasePageId
	    ;;
	*)
	    clusterPageId=$clusterStagingPageId
	    ;;
	esac
	
	# get current cluster page from confluence
	echo $(curl \
	-H "Accept: application/json" \
	-H "Authorization: Basic $atlassianBasicAuth" \
	-H "Content-Type:application/json" \
	-X GET "$atlassianBaseUrl/wiki/rest/api/content/${clusterPageId}?expand=space,body.storage,version") > page.json
	
	# increment and replace version
	version="$(jq '.version.number' page.json)"
	echo "page version: $version"
	version=$((version + 1))
	echo "increment to: $version"
	echo $(jq -r --arg version1 "$version" '.version.number = $version1' page.json) > page.json
	
	#echo "\\n-------\\n page with new version: $version \\n $(cat page.json) \\n-------\\n"
	
	# load replacement strings
	local namespace="$(getvalue org.example.namespace)"
	local release="$(getvalue org.example.release)"
	local version="$(getvalue org.example.version)"
	local jiraIssueId="$(getvalue org.example.jira.issueId)"
	local jiraStoryId="$(getvalue org.example.jira.storyId)"
	local jiraTestrailsId="$(getvalue org.example.jira.testrailsId)"
	local jiraCreator="$(getvalue org.example.jira.creator)"
	local jiraReporter="$(getvalue org.example.jira.reporter)"
	local jiraAssignee="$(getvalue org.example.jira.assignee)"
	local branch="$(getvalue org.example.branch)"
	local commit="$(getvalue org.example.commit)"
	local ip="$(getvalue org.example.ip)"
	local timestamp="$(date +%s)"
	local randomId="$(echo -n $namespace$timestamp | md5sum)"
	local fileSpring="$(cat ./example-cloud-config/application.yaml)"
	local fileDeploy="$(cat ./deploy.yaml)"
	local fileHelm="$(cat ./deployment/example/values.yaml)"
	local fileKubernetes="$(cat ./.yaml)"
	local fileDockerfile="$(cat ./deploy.yaml)"
	local fileBuild="$(cat ./build.yaml)"
	
	# load template
	cp ./docs/confluence-template.html ./template.html
	template=$(cat ./template.html)
	
	# replace placeholders
	template=${template//ORG_EXAMPLE_RELEASE/$release}
	template=${template//ORG_EXAMPLE_NAMESPACE/$namespace}
	template=${template//ORG_EXAMPLE_JIRA/$jiraIssueId}
	template=${template//ORG_EXAMPLE_JIRA_ISSUE/$jiraIssueId}
	template=${template//ORG_EXAMPLE_JIRA_STORY/$jiraStoryId}
	template=${template//ORG_EXAMPLE_JIRA_TESTRAILS/$jiraTestrailsId}
	template=${template//ORG_EXAMPLE_JIRA_CREATOR/$jiraCreator}
	template=${template//ORG_EXAMPLE_JIRA_REPORTER/$jiraReporter}
	template=${template//ORG_EXAMPLE_JIRA_AASSIGNEE/$jiraAssignee}
	template=${template//ORG_EXAMPLE_STORY/$story}
	template=${template//ORG_EXAMPLE_BRANCH/$branch}
	template=${template//ORG_EXAMPLE_COMMIT/$commit}
	template=${template//ORG_EXAMPLE_IP/$ip}
	template=${template//ORG_EXAMPLE_VERSION/$version}
	template=${template//ORG_EXAMPLE_RANDOM_ID/$randomId}
	template=${template//ORG_EXAMPLE_FILE_SPRING/$fileSpring}
	template=${template//ORG_EXAMPLE_FILE_DEPLOY/$fileDeploy}
	template=${template//ORG_EXAMPLE_FILE_HELM/$fileHelm}
	template=${template//ORG_EXAMPLE_FILE_KUBERNETES/$fileKubernetes}
	template=${template//ORG_EXAMPLE_FILE_DOCKERFILE/$fileDockerfile}
	template=${template//ORG_EXAMPLE_FILE_BUILD/$fileBuild}
	
	# write template back and html escape quotes
	echo "$template" > ./template.html
	sed 's/\"/\\"/g' ./template.html
	template=$(cat ./template.html)
	
	#echo "--- confluence part template after replacement: ---"
	#echo "$template"
	#echo "---"
	
	# find and replace heading 1 (<h1>) with heading and expandable panel for current namespace
	contentHtml=$(jq -r '.body.storage.value' page.json)
	echo "$contentHtml" > ./content.html
	searchString="<h1>Deployments</h1>"
	contentHtml=${contentHtml//$searchString/$template}
	echo "$contentHtml" > ./content.html
	
	#echo "--- html content after replacement: ---"
	#echo "$contentHtml"
	#echo "---"

	echo $(jq --arg content1 "$contentHtml" '.body.storage.value = $content1' page.json) > page.json
	curl -H "Authorization: Basic $atlassianBasicAuth" \
	-H "Accept: application/json" \
	-H "Content-Type:application/json" \
	-X PUT -d "$(cat page.json)" "$atlassianBaseUrl/wiki/rest/api/content/${clusterPageId}"
}

# Generate report summary html pages
example_report_html() {
	echo "example_report_html"

	local release=$(getvalue org.example.release)
	local name=$(getvalue org.example.namespace)
	local jiraIssueId=$(getvalue org.example.jira)
	local atlassianBaseUrl=$(getvalue org.example.atlassian.baseUrl)
	local cloudbuildBucket=$(getvalue org.example.bucket.cloudbuild)
	
	# generate html report
	indexHtml="build-artifacts/index-$name.html"
	
	echo "<html>" >> $indexHtml
	echo "	<body>" >> $indexHtml
	echo "		<h1>Microservice Example - $name</h1>" >> $indexHtml
	echo "		<h2>General</h2>" >> $indexHtml
	echo "		<ul>" >> $indexHtml
	echo "			<li><a href='$atlassianBaseUrl/wiki/display/EP/$name'>Documentation (Confluence)</a></li>" >> $indexHtml
	echo "			<li><a href='$atlassianBaseUrl/browse/$jiraIssueId?jql=project%20%3D%20PLTTEAM'>Sprint (Jira)</a></li>" >> $indexHtml
	echo "			<li><a href='$atlassianBaseUrl/wiki/display/EP/API'>Swagger UI</a></h2>" >> $indexHtml
	echo "			<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/services.txt'>Services</a></li>" >> $indexHtml
	echo "			<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/NAMESPACE.txt'>NAMESPACE</a></li>" >> $indexHtml
	echo "			<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/namespace.txt'>Kubernetes Namespace</a></li>" >> $indexHtml
	echo "			<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/manifests.yml'>Kubernetes Manifest (Summary)</a></li>" >> $indexHtml
	echo "		</ul>" >> $indexHtml
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		echo "		<h2>$artifact</h2>" >> $indexHtml
		echo "		<ul>" >> $indexHtml
		echo "		<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/artifact/docker/Dockerfile'>Dockerfile</a></li>" >> $indexHtml
		echo "		<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/manifests/artifact.yml'>Kubernetes Manifests</a></li>" >> $indexHtml
		echo "		<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/artifact/kube/kubernetes.yml'>Kubernetes Manifests (2)</a></li>" >> $indexHtml
		echo "		<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/artifact/test/cucumber.html'>Cucumber Test report</a></li>" >> $indexHtml
		echo "		<li><a href='https://storage.googleapis.com/$cloudbuildBucket/$name/artifact/test/surefire.xml'>Surefire Test report</a></li>" >> $indexHtml
		echo "		</ul>" >> $indexHtml
	done < services.yaml
	echo "	</body>" >> $indexHtml
	echo "</html>" >> $indexHtml
}

example_report_copy() {
	echo "example_report_copy"
	
	local release=$(getvalue org.example.release)
	local helmChartBucket=$(getvalue org.example.bucket.helm)
	local cloudbuildBucket=$(getvalue org.example.bucket.cloudbuild)

	# copy helm repository 
	gsutil -m cp -r deployment/example/*.tgz "gs://$helmChartBucket/"
	gsutil -m cp -r deployment/example/index.yaml "gs://$helmChartBucket/"
	gsutil -m setmeta -h "Cache-Control:private, max-age=0, no-transform" "gs://$helmChartBucket/index.yaml"
	
	# note: this method also sets access permission for swagger.yaml files (e.g. for access through confluence)
	# Don't forget to set CORS values for storage bucket!
	
	# copy build artifacts
	gsutil -m cp -r build-artifacts/ gs://$cloudbuildBucket/$release/
	gsutil -m acl set -R -a -f public-read gs://$cloudbuildBucket/$release/**/api/swagger.*
	gsutil -m setmeta -h "Cache-Control:private, max-age=0, no-transform" gs://example-cloudbuild/$release/**/api/swagger.*
	
	# copy build artifacts - latest (TODO: this should only be triggerd for releases)
	gsutil -m cp -r build-artifacts/ gs://$cloudbuildBucket/latest/
	gsutil -m acl set -R -a -f public-read gs://$cloudbuildBucket/latest/**/api/swagger.*
	gsutil -m setmeta -h "Cache-Control:private, max-age=0, no-transform" gs://example-cloudbuild/latest/**/api/swagger.*
}

# push generated php client into certain repository
example_report_php_client() {
	echo "example_report_php_client"

	local release=$(getvalue org.example.release)
	
	while IFS='' read -r artifact || [[ -n "$artifact" ]]; do
		if [ -d "example/$artifact/target/php-client" ]; then
			mkdir -p example-php-client/$artifact-client
			cp -r example/$artifact/target/SwaggerClient-php/* example-php-client/$artifact-client/.
		fi
	done < services.yaml
	
	example_git_push example-php-client "Generated Microservice Example PHP Client $release"
}

# generate cloud DNS entry to subdomain
example_report_dns() {
	echo "example_report_dns"
	
	# TODO: get ingress ip and create cloud DNS entry
	#local ingressIp=$1
	
	echo "dns reporting not implemented"
}

# generate helm repository
example_report_helm_repo() {
	echo "example_report_helm_repo"
	
	local helmChartBucket=$(getvalue org.example.bucket.helm)
	
	# run helm repository with repository dashboard-UI 'monocular'
	#helm install stable/nginx-ingress --debug
	#helm repo add monocular https://kubernetes-helm.github.io/monocular --debug
	#helm install monocular/monocular --debug
	
	cd helm
	helm repo index ./example --url "https://$helmChartBucket.storage.googleapis.com" --debug
	cd ..
}

getvalue() {
	local propertyKey=$1
	local helmProperties="./deployment/example/values.properties"
	local deployProperties="./deploy.properties"
	local buildProperties="./build.properties"
	
	while IFS='=' read -r key value
		do
		if [ "${propertyKey}" == "${key}" ]; then
	    	echo "${value}"; exit 0;
		fi
	done < "$helmProperties"
	while IFS='=' read -r key value
	do
		if [ "${propertyKey}" == "${key}" ]; then
			echo "${value}"; exit 0;
		fi
	done < "$deployProperties"
	while IFS='=' read -r key value
	do
		if [ "${propertyKey}" == "${key}" ]; then
	  	  echo "${value}"; exit 0;
		fi
	done < "$buildProperties"
}

# The regex-pattern for kubernetes namespaces is very specific and strict: [a-z0-9]([-a-z0-9]*[a-z0-9])?')
# It excepts only lower-case characters and a maximum length of 63 characters and only alpha-numeric as first and last characters.
to_namespace() {
	local inputString=$1
	
	# replace special characters:
	namespace="$(echo -e "${inputString}" | sed 's/\/-/g')"
	namespace="$(echo -e "${inputString}" | sed 's/[^a-zA-Z0-9]/-/g')"
	
	#Generate tag version for Docker images
	#VERSION="$VERSION-${BRANCH_NAME//\//-}"
	
	# Generate kubernetes namespace with prefix, version and branchname (lowercase and without dots)
	#INPUT="$INPUT-v${VERSION//\./}-${BRANCH_NAME//\//-}"
	
	# Lower-case:
	namespace="$(tr '[:upper:]' '[:lower:]' <<< "$namespace")"
	
	# Trim length:
	namespace="${namespace:0:62}"
	
	# Check for forbidden first and last characters and finally save namespace in file:
	echo "${namespace}" | sed "s/\(.*\)-/\1/"
}

# parse yaml to properties file
parse_yaml() {
	local prefix=$2
    local s
    local w
    local fs
    s='[[:space:]]*'
    w='[a-zA-Z0-9_-]*'
    fs="$(echo @|tr @ '\034')"
    sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" "$1" |
    awk -F"$fs" '{
    indent = length($1)/2;
    vname[indent] = $2;
    for (i in vname) {if (i > indent) {delete vname[i]}}
        if (length($3) > 0) {
            vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])(".")}
            printf("%s%s%s=%s\n", "'"$prefix"'",vn, $2, $3);
        }
    }' | sed 's/_=/+=/g'
}

# get jira user
example_init_jira() {
	local jiraIssueId=$(getvalue org.example.jira.issueId)
	local atlassianBaseUrl=$(getvalue org.example.atlassian.baseUrl)
	local atlassianBasicAuth=$(getvalue org.example.atlassian.basic)
	
	echo $(curl -H "Authorization: Basic $atlassianBasicAuth" \
	-H "Accept: application/json" \
	-H "Content-Type:application/json" \
	-X GET "$atlassianBaseUrl/rest/api/2/issue/$jiraIssueId") > issue.json
	
	assignee="$(jq -r '.fields.assignee.key' issue.json)"
	reporter="$(jq -r '.fields.reporter.key' issue.json)"
	creator="$(jq -r '.fields.creator.key' issue.json)"
	assigneeEmail="$(jq -r '.fields.assignee.emailAddress' issue.json)"
	reporterEmail="$(jq -r '.fields.reporter.emailAddress' issue.json)"
	creatorEmail="$(jq -r '.fields.creator.emailAddress' issue.json)"
	#version="$(jq '.fields.customField' issue.json)"
	#cluster="$(jq '.fields.customField' issue.json)"
	
	local deployYaml="./deploy.yaml"
	local deployPropertiesFile="${deployYaml/yaml/properties}"
	
	# add additional parameters to deploy.properties
	echo "org.example.jira.assignee=$assignee" >> "$deployPropertiesFile"
	echo "org.example.jira.reporter=$reporter" >> "$deployPropertiesFile"
	echo "org.example.jira.creator=$creator" >> "$deployPropertiesFile"
	echo "org.example.jira.assigneeEmail=$assigneeEmail" >> "$deployPropertiesFile"
	echo "org.example.jira.reporterEmail=$reporterEmail" >> "$deployPropertiesFile"
	echo "org.example.jira.creatorEmail=$creatorEmail" >> "$deployPropertiesFile"
}

# initialize a build with branch-name and commitId
example_init() {
	echo "example_init"
	
	local branchName=$1
	local commitId=$2
	
	# parse and convert values.yaml, deploy.yaml and build.yaml to properties file.
	local helmYaml="./deployment/example/values.yaml"
	local helmPropertiesFile="${helmYaml/yaml/properties}"
	local deployYaml="./deploy.yaml"
	local deployPropertiesFile="${deployYaml/yaml/properties}"
	local buildYaml="./build.yaml"
	local buildPropertiesFile="${buildYaml/yaml/properties}"
	helmPropertiesFile="${helmPropertiesFile/yml/properties}"
	parse_yaml $helmYaml > "$helmPropertiesFile"
	deployPropertiesFile="${deployPropertiesFile/yml/properties}"
	parse_yaml $deployYaml > "$deployPropertiesFile"
	buildPropertiesFile="${buildPropertiesFile/yml/properties}"
	parse_yaml $buildYaml > "$buildPropertiesFile"
	
	# add additional parameters to deploy.properties
	
	# set branch and commitId
	echo "org.example.branch=$branchName" >> "$deployPropertiesFile"
	echo "org.example.commit=${commitId:0:7}" >> "$deployPropertiesFile"
	echo "org.example.issuer=JohnDoe" >> "$deployPropertiesFile"
	
	# set namespace
	version=$(getvalue org.example.version)
	namespace=$(to_namespace "example-v${version//\./}, ${branchName//\//-}")
	echo "org.example.namespace=$namespace" >> "$deployPropertiesFile"
	
	# set release name
	version=$(getvalue org.example.version)
	issueId=$(getvalue org.example.jira.issueId)
	release="example-$version-$issueId"
	echo "org.example.release=$release" >> "$deployPropertiesFile"
	
	# set bitbucket base URL
	atlassianUser=$(getvalue org.example.atlassian.user)
	atlassianToken=$(getvalue org.example.atlassian.token)
	atlassianProject=$(getvalue org.example.atlassian.bitbucket.project)
	atlassianBitbucketBaseUrl="https://$atlassianUser:$atlassianToken@bitbucket.org/$atlassianProject"
	echo "org.example.atlassian.bitbucket.baseUrl=$atlassianBitbucketBaseUrl" >> "$deployPropertiesFile"
	
	# get jira ticket details
	example_init_jira
	
	# log all properties
	echo "--- helm values ---"
	echo "$(cat ./deployment/example/values.properties)"
	echo "--- deploy values ---"
	echo "$(cat ./deploy.properties)"
	echo "--- build values ---"
	echo "$(cat ./build.properties)"
	
	mkdir -p build-artifacts
    mkdir -p build-artifacts/manifests
    touch build-artifacts/manifests.yaml
    
	# save yaml and properties files for reporting later.
    cp ./helm/example/values.yaml build-artifacts/.
    cp ./helm/example/values.properties build-artifacts/.
    cp ./deploy.yaml build-artifacts/.
    cp ./deploy.properties build-artifacts/.
    cp ./build.yaml build-artifacts/.
    cp ./build.properties build-artifacts/.
    
    # set service account to be used for all cloud oparations
    local sa="service-account.json"
	if [ ! -f "$sa" ]
	then
		gsutil -m cp gs://example-cloudbuild/service-account.json "$sa"
	fi
}

# Initialize cloudbuilder service account
sa="service-account.json"
export GOOGLE_APPLICATION_CREDENTIALS="$sa"


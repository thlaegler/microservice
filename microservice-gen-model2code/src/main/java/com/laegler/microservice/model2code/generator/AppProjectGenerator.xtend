package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.lib.cucumber.GherkinAdapter
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.microservice.app.AppPomXml
import com.laegler.microservice.model2code.template.microservice.app.res.AppYaml
import com.laegler.microservice.model2code.template.microservice.app.res.BootstrapYaml
import com.laegler.microservice.model2code.template.microservice.app.src.AppConfigXtend
import com.laegler.microservice.model2code.template.microservice.app.src.AppXtend
import com.laegler.microservice.model2code.template.microservice.app.test.CucumberFeature
import com.laegler.microservice.model2code.template.microservice.app.test.DefaultCucumberFeatureStepsXtend
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Template

@Named
class AppProjectGenerator extends Generator {

	protected static final Logger log = LoggerFactory.getLogger(AppProjectGenerator)

	@Inject GherkinAdapter gherkinAdapter

	@Inject AppPomXml appPomXml

	// Sources
	@Inject AppXtend appXtend
	@Inject AppConfigXtend appConfigXtend

	// Resources
	@Inject AppYaml appYaml
	@Inject BootstrapYaml bootstrapYaml

	// Tests
	@Inject CucumberFeature featureFile
	@Inject DefaultCucumberFeatureStepsXtend featureSteps

	override List<Project> generate(Architecture a) {
		log.debug('Generating Spring App project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateAppProject)
		]
		projects
	}

	protected def Project generateAppProject(Artifact a) {
		log.debug('Generating Spring App project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(a.name, 'app')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(a.name, 'app')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates => [
				add(appPomXml.getTemplate(p))
				add(appXtend.getTemplate(p))
				add(appConfigXtend.getTemplate(p))
				add(appYaml.getTemplate(p))
				add(bootstrapYaml.getTemplate(p))
				add(p.generateKubeNamespaceYaml(a))
				add(p.generateKubeReplicaSetYaml(a))
				add(p.generateKubeServiceYaml(a))
				add(p.generateKubeIngressYaml(a))
				if (a.featureFile !== null) {
					val gherkin = gherkinAdapter.parse(a.featureFile)
					add(featureFile.getTemplate(p, gherkin))
					add(featureSteps.getTemplate(p, gherkin))
				}
			]
		]
	}

	protected def Template generateKubeNamespaceYaml(Project p, Artifact a) {
		LOG.debug('  Generating template: Kubernetes Namespace manifest yaml')

		templateBuilder //
		.project(p) //
		.fileName('kube-' + a.name.toLowerCase + '-ns') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath + '/kube') //
		.content('''
			---
			apiVersion: v1
			kind: Namespace
			metadata:
			  name: «world.name.toLowerCase»
			  labels:
			    name: «world.name.toLowerCase»
			    app: «world.name.toLowerCase»
		''') //
		.build
	}

	protected def Template generateKubeServiceYaml(Project p, Artifact a) {
		LOG.debug('  Generating template: Kubernetes Service manifest yaml')

		templateBuilder //
		.project(p) //
		.fileName('kube-' + a.name.toLowerCase + '-svc') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath + '/kube') //
		.content('''
			---
			apiVersion: v1
			kind: Service
			metadata:
			  name: «a.name.toLowerCase»
			  namespace: «world.name.toLowerCase»
			  labels:
			  	name: «world.name.toLowerCase»
			  	app: «world.name.toLowerCase»
			spec:
			  selector:
			    name: «world.name.toLowerCase»
			    app: «world.name.toLowerCase»
			  type: NodePort
			  ports:
			  - name: api
			    port: 8080
		''') //
		.build
	}

	protected def Template generateKubeReplicaSetYaml(Project p, Artifact a) {
		LOG.debug('  Generating template: Kubernetes ReplicaSet manifest yaml')

		templateBuilder //
		.project(p) //
		.fileName('kube-' + a.name.toLowerCase + '-rs') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath + '/kube') //
		.content('''
			---
			apiVersion: extensions/v1beta1
			kind: ReplicaSet
			metadata:
			  name: «a.name.toLowerCase»
			  namespace: «world.name.toLowerCase»
			  labels:
			    name: «world.name.toLowerCase»
			    app: «world.name.toLowerCase»
			spec:
			  replicas: 2
			  selector:
			    matchLabels:
			      name: «world.name.toLowerCase»
			      app: «world.name.toLowerCase»
			  template:
			    metadata:
			      labels:
			        name: «world.name.toLowerCase»
			        app: «world.name.toLowerCase»
			    spec:
			      containers:
			      - name: echoheaders
			        image: gcr.io/google_containers/echoserver:1.4
			        ports:
			        - containerPort: 9090
			        readinessProbe:
			          httpGet:
			            path: /healthz
			            port: 9090
			          periodSeconds: 1
			          timeoutSeconds: 1
			          successThreshold: 1
			          failureThreshold: 10
			      - name: «a.name.toLowerCase»
			        image: «a.name.toLowerCase»:«world.version»
			        imagePullPolicy: IfNotPresent
			        ports:
			        - name: api
			          containerPort: 8080
			        livenessProbe:
			          httpGet:
			            path: /health
			            port: 8080
			          initialDelaySeconds: 3
			          periodSeconds: 3
			      restartPolicy: Always
			      terminationGracePeriodSeconds: 30
		''') //
		.build
	}

	protected def Template generateKubeIngressYaml(Project p, Artifact a) {
		LOG.debug('  Generating template: Kubernetes Ingress manifest yaml')

		templateBuilder //
		.project(p) //
		.fileName('kube-' + a.name.toLowerCase + '-ingress') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath + '/kube') //
		.content('''
			---
			apiVersion: extensions/v1beta1
			kind: Ingress
			metadata:
			  name: «a.name.toLowerCase»
			  namespace: «world.name.toLowerCase»
			  labels:
			    name: «world.name.toLowerCase»
			    app: «world.name.toLowerCase»
			spec:
			  backend:
			    serviceName: «a.name.toLowerCase»
			    servicePort: 8080
		''') //
		.build
	}

}
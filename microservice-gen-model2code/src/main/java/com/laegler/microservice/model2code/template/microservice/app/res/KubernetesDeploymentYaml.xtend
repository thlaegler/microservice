package com.laegler.microservice.model2code.template.microservice.app.res

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template

import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class KubernetesDeploymentYaml {

	protected static final Logger log = LoggerFactory.getLogger(KubernetesDeploymentYaml)

	@Inject protected World world
	
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		val fileName = p.name + '-kube-deployment'
		val relativPath = namingStrategy.resPath
		log.debug('  Generating template: {}/{}.yml', fileName, relativPath)
		
		Template::builder //
		.project(p) //
		.fileName(fileName) //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath) //
		.documentation('KubeDeploymentYaml') //
		.skipStamping(true) //
		.content('''
			apiVersion: v1
			kind: Namespace
			metadata:
			  name: «world.name»
			  labels:
			    name: «world.name»
			    provider: «world.vendor»
			    group: «p.basePackage»
			    version: «p.version»
			---
			apiVersion: extensions/v1beta1
			kind: Deployment
			metadata:
			  name: «p.name»
			  namespace: platform
			  labels:
			    app: «p.name»
			    provider: «world.vendor»
			    group: «p.basePackage»
			    project: «p.name»
			    version: «p.version»
			spec:
			  replicas: 1
			  template:
			    metadata:
			      labels:
			        app: «p.name»
			    spec:
			      containers:
			      - name: «p.name»
			        image: gcr.io/«world.name»-123456/«p.name»:«p.version»
			        imagePullPolicy: IfNotPresent
			        ports:
			        - name: grpc
			          containerPort: 7070
			        - name: rest
			          containerPort: 8080
			        - name: soap
			          containerPort: 6060
			      restartPolicy: Always
			      terminationGracePeriodSeconds: 30
		''') //
		.build
	}
}

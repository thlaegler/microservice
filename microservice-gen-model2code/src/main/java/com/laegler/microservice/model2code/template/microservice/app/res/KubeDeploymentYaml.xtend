//package com.laegler.microservice.model2code.template.microservice.app.res
//
//import com.laegler.microservice.adapter.model.FileType
//import com.laegler.microservice.adapter.model.Project
//import com.laegler.microservice.adapter.model.Template
//import com.laegler.microservice.adapter.model.TemplateBuilder
//import com.laegler.microservice.adapter.model.World
//import com.laegler.microservice.adapter.util.NamingStrategy
//import javax.inject.Inject
//import javax.inject.Named
//import org.slf4j.Logger
//import org.slf4j.LoggerFactory
//
//@Named
//class KubeDeploymentYaml {
//
//	protected static final Logger log = LoggerFactory.getLogger(KubeDeploymentYaml)
//
//	@Inject protected World world
//	@Inject protected TemplateBuilder templateBuilder
//	@Inject protected NamingStrategy namingStrategy
//
//	public def Template getTemplate(Project p) {
//		val fileName = p.name + '-kube-deployment'
//		val relativPath = namingStrategy.resPath
//		log.debug('  Generating template: {}/{}.yml', fileName, relativPath)
//		
//		templateBuilder //
//		.project(p) //
//		.fileName(fileName) //
//		.fileType(FileType.YAML) //
//		.relativPath(relativPath) //
//		.documentation('KubeDeploymentYaml') //
//		.skipStamping(true) //
//		.content('''
//			server:
//			  port: 8080
//		''') //
//		.build
//	}
//}

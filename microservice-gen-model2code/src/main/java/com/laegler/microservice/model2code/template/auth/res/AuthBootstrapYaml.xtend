package com.laegler.microservice.model2code.template.auth.res

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template

import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.LoggerFactory
import org.slf4j.Logger

@Named
class AuthBootstrapYaml {

	static final Logger log = LoggerFactory.getLogger(AuthBootstrapYaml)

	@Inject World world
	@Inject NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.resPath
		log.debug('  Generating template: {}/bootstrap.yml', relativPath)

		Template::builder //
		.project(p) //
		.fileName('bootstrap') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath) //
		.documentation('BootstrapYaml') //
		.skipStamping(true) //
		.content('''
			spring:
			  application:
			    name: @project.artifactId@
			  cloud:
			    config:
			      uri: @«world.vendorPrefix».spring.config.uri@
		''') //
		.build
	}
}

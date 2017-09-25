package com.laegler.microservice.model2code.template.env.oauth2.res

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
class OAuth2AppYaml {
	
	static final Logger log = LoggerFactory.getLogger(OAuth2AppYaml)

	@Inject World world
	@Inject NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		log.debug('  Generating template: {}/application.yml', namingStrategy.resPath)
		
		Template::builder //
		.project(p) //
		.fileName('application') //
		.fileType(FileType.YAML) //
		.relativPath(namingStrategy.resPath) //
		.documentation('AppYaml') //
		.skipStamping(true) //
		.content('''
			«world.vendorPrefix»:
			  version: @project.version@
			  description: @project.description@
			  java:
			    version: @java.version@
			server:
			  port: ${«world.vendorPrefix».«p.name».rest.port}
		''') //
		.build
	}
}

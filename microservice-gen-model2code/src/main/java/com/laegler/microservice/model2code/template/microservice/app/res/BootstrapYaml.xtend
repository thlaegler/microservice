package com.laegler.microservice.model2code.template.microservice.app.res

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.LoggerFactory
import org.slf4j.Logger

@Named
class BootstrapYaml {

	static final Logger log = LoggerFactory.getLogger(BootstrapYaml)

	@Inject TemplateBuilder templateBuilder
	@Inject NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.resPath
		log.debug('  Generating template: {}/bootstrap.yml', relativPath)

		templateBuilder //
		.project(p) //
		.fileName('bootstrap') //
		.fileType(FileType.YAML) //
		.relativPath(relativPath) //
		.documentation('BootstrapYaml') //
		.skipStamping(true) //
		.content('''
			server:
			  port: 8080
		''') //
		.build
	}
}

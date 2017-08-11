package com.laegler.microservice.model2code.template.microservice.app.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class AppConfigXtend extends Xtend {

	protected static final Logger log = LoggerFactory.getLogger(AppConfigXtend)

	public def Template getTemplate(Project p) {
		val path = namingStrategy.getSrcPathWithPackage(p)
		log.debug('  Generating template: {}/ApplicationConfig.xtend', path)

		Template::builder //
		.project(p) //
		.fileName('ApplicationConfig') //
		.fileType(FileType.XTEND) //
		.relativPath(path) //
		.documentation('Spring Application Configuration') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage»
			
			import javax.inject.Inject
			import org.slf4j.Logger
			import org.springframework.context.annotation.Configuration
			
			@Configuration
			class ApplicationConfig {
			
				@Inject	Logger log
			
			}
		''') //
		.build
	}

}

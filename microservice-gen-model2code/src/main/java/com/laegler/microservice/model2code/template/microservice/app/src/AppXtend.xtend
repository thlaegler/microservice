package com.laegler.microservice.model2code.template.microservice.app.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class AppXtend extends Xtend {

	protected static final Logger log = LoggerFactory.getLogger(AppXtend)

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.getSrcPathWithPackage(p)
		log.debug('  Generating template: {}/Application.xtend', relativPath)

		Template::builder //
		.project(p) //
		.fileName('Application') //
		.fileType(FileType.XTEND) //
		.relativPath(relativPath) //
		.documentation('Spring Application') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage»
			
			import org.slf4j.Logger
			import org.slf4j.LoggerFactory
			import org.springframework.boot.SpringApplication
			import org.springframework.boot.autoconfigure.SpringBootApplication
			
			@SpringBootApplication
			class Application {
			
				private static final Logger LOG = LoggerFactory.getLogger(Application);
			
				public static def void main(String[] args) {
					SpringApplication.run(Application, args)
				}
			
			}
		''') //
		.build
	}

}

package com.laegler.microservice.model2code.template.env.oauth2.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class OAuth2AppJava extends Java {

	private static final Logger log = LoggerFactory.getLogger(OAuth2AppJava)

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.getSrcPathWithPackage(p)
		log.debug('  Generating template: {}/Application.xtend', relativPath)

		Template::builder //
		.project(p) //
		.fileName('Application') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p))
		.documentation('Spring Application') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage»
			
			import org.slf4j.Logger
			import org.slf4j.LoggerFactory
			import org.springframework.boot.SpringApplication
			import org.springframework.boot.autoconfigure.SpringBootApplication

			@SpringBootApplication
			public class Application {
			
				private static final Logger LOG = LoggerFactory.getLogger(Application.class);
			
				public static def void main(String[] args) {
					var ConfigurableApplicationContext ctx = SpringApplication.run(Application.class, args);
					LOG.info('Started «p.canonicalName» with ID: {}', ctx.getId());
				}
			
			}
		''') //
		.build
	}

}

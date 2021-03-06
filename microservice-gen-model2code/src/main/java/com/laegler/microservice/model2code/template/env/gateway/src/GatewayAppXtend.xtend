package com.laegler.microservice.model2code.template.env.gateway.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class GatewayAppXtend extends Xtend {

	private static final Logger LOG = LoggerFactory.getLogger(GatewayAppXtend)

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.getSrcPathWithPackage(p)
		LOG.debug('  Generating template: {}/Application.xtend', relativPath)

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
			class Application {
			
				private static final Logger LOG = LoggerFactory.getLogger(Application);
			
				public static def void main(String[] args) {
					var ConfigurableApplicationContext ctx = SpringApplication.run(Application, args)
					LOG.info('Started ' + ctx.getId());
				}
			
			}
		''') //
		.build
	}

}

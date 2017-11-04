package com.laegler.microservice.model2code.template.env.gateway.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class GatewayAppConfigXtend extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(GatewayAppConfigXtend)

	public def Template getTemplate(Project p) {
		val path = namingStrategy.getSrcPathWithPackage(p)
		LOG.debug('  Generating template: {}/ApplicationConfig.xtend', path)

		Template::builder //
		.project(p) //
		.fileName('ApplicationConfig') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p))
		.documentation('Spring Application Configuration') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage»
			
			import javax.inject.Inject
			import org.slf4j.Logger
			import org.springframework.context.annotation.Configuration
			
			@Configuration
			class ApplicationConfig {
			
				@Inject	Logger LOG
			
			}
		''') //
		.build
	}

}

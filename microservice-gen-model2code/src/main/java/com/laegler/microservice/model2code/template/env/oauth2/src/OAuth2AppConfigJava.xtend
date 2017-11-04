package com.laegler.microservice.model2code.template.env.oauth2.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class OAuth2AppConfigJava extends Java {

	protected static final Logger LOG = LoggerFactory.getLogger(OAuth2AppConfigJava)

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
			import org.slf4j.LoggerFactory
			import org.springframework.context.annotation.Configuration
			
			@Configuration
			public class ApplicationConfig {
			
				private static final Logger LOG = LoggerFactory.getLogger(ApplicationConfig.class);
			
				// @Autowired
				// private SomeService service;
			
			}
		''') //
		.build
	}

}

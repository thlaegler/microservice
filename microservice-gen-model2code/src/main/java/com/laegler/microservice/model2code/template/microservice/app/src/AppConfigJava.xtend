package com.laegler.microservice.model2code.template.microservice.app.src

import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class AppConfigJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(AppConfigJava)

	@Inject private extension NamingStrategy _name

	public def Template getTemplate(Project p) {
		var path = p.srcPathWithPackage
		path = path.substring(0,path.lastIndexOf('/'))
		log.debug('  Generating template: {}/ApplicationConfig.xtend', path)

		Template::builder //
		.project(p) //
		.fileName('ApplicationConfig') //
		.relativPath(path) //
		.documentation('Spring Application Configuration') //
		.skipStamping(true) //
		.content('''
			package «p.basePackage»;
			
			import javax.inject.Inject;
			import org.slf4j.Logger;
			import org.springframework.context.annotation.Configuration;
			
			@Configuration
			public class ApplicationConfig {
			
			}
		''') //
		.build
	}

}

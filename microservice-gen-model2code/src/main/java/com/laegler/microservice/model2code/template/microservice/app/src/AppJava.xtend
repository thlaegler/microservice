package com.laegler.microservice.model2code.template.microservice.app.src

import com.laegler.microservice.adapter.model.Java
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model.Artifact

@Named
class AppJava extends Java {

	protected static final Logger log = LoggerFactory.getLogger(AppJava)

	@Inject private extension NamingStrategy _name

	public def Template getTemplate(Project p, Artifact a) {
		var path = p.srcPathWithPackage
		path = path.substring(0,path.lastIndexOf('/'))
		log.debug('  Generating template: {}/Application.java', path)

		Template::builder //
		.project(p) //
		.fileName(a.name.camelUp + 'Application') //
		.relativPath(path) //
		.documentation('Spring Application') //
		.content('''
			package «p.basePackage»;
			
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			import org.springframework.boot.SpringApplication;
			import org.springframework.boot.autoconfigure.SpringBootApplication;
			
			@SpringBootApplication
			public class «a.name.camelUp»Application {
			
				private static final Logger LOG = LoggerFactory.getLogger(«a.name.camelUp»Application.class);
			
				public static def void main(String[] args) {
					SpringApplication.run(«a.name.camelUp»Application.class, args);
				}
			
			}
		''') //
		.build
	}

}

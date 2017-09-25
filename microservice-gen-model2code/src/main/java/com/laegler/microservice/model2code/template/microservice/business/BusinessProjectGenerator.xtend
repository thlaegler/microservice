package com.laegler.microservice.model2code.template.microservice.business

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.microservice.business.BusinessPomXml
import com.laegler.microservice.model2code.template.microservice.business.src.ServiceXtend
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class BusinessProjectGenerator extends Generator {

	protected static final Logger log = LoggerFactory.getLogger(BusinessProjectGenerator)

	@Inject BusinessPomXml businessPom
	@Inject ServiceXtend serviceXtend

	override List<Project> generate(Architecture a) {
		log.debug('Generating Business project(s) for architecture {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateBusinessProject)
		]
		projects
	}

	protected def Project generateBusinessProject(Artifact a) {
		log.debug('Generating Business project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'business')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'business')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates => [
				add(businessPom.getTemplate(p))
				a.entities?.forEach [ e |
					add(serviceXtend.getTemplate(p, e))
				]
			]
		]
	}

}

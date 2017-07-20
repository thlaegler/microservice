package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.microservice.model.ModelPomXml
import com.laegler.microservice.model2code.template.microservice.model.src.EntityXtend
import com.laegler.microservice.model2code.template.microservice.model.src.repo.jpa.JpaRepoXtend
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class ModelProjectGenerator extends Generator {

	protected static final Logger log = LoggerFactory.getLogger(AppProjectGenerator)

	@Inject ModelPomXml modelPomXml
	@Inject EntityXtend entityXtend
	@Inject JpaRepoXtend jpaRepoXtend

	override List<Project> generate(Architecture a) {
		log.debug('Generating Model project(s) for architecture {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateModelProject)
		]
		projects
	}

	protected def Project generateModelProject(Artifact a) {
		log.debug('Generating Model project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(a.name, 'model')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(a.name, 'model')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates => [
				add(modelPomXml.getTemplate(p))
				a.entities?.forEach [ e |
					add(entityXtend.getTemplate(p, e))
					add(jpaRepoXtend.getTemplate(p, e))
				]
			]
		]
	}

}

package com.laegler.microservice.model2code.template.microservice.model

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
import java.util.Arrays

@Named
class ModelProjectGenerator extends Generator {

	protected static final Logger LOG = LoggerFactory.getLogger(ModelProjectGenerator)

	@Inject ModelPomXml modelPomXml
	@Inject EntityXtend entityXtend
	@Inject JpaRepoXtend jpaRepoXtend

	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating Model project(s) for architecture {}', a.name)

		Arrays.asList(a.generateModelProject(art))
	}

	protected def Project generateModelProject(Architecture a, Artifact art) {
		LOG.debug('Generating Model project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'model')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'model')) //
		.microserviceModel(art) //
		.build => [ p |
			p.templates.add(modelPomXml.getTemplate(p))
			art.entities?.forEach [ e |
				p.templates.add(entityXtend.getTemplate(p, e))
				p.templates.add(jpaRepoXtend.getTemplate(p, e))
			]
		]
	}

}

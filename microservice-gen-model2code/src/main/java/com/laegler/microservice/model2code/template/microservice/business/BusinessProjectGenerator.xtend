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
import java.util.Arrays

@Named
class BusinessProjectGenerator extends Generator {

	protected static final Logger LOG = LoggerFactory.getLogger(BusinessProjectGenerator)

	@Inject BusinessPomXml businessPom
	@Inject ServiceXtend serviceXtend

	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating Business project(s) for architecture {}', a.name)

		Arrays.asList(a.generateBusinessProject(art))
	}

	protected def Project generateBusinessProject(Architecture a, Artifact art) {
		LOG.debug('Generating Business project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'business')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'business')) //
		.microserviceModel(art) //
		.build => [ p |
			p.templates => [
				add(businessPom.getTemplate(p))
				art.entities?.forEach [ e |
					add(serviceXtend.getTemplate(p, e))
				]
			]
		]
	}

}

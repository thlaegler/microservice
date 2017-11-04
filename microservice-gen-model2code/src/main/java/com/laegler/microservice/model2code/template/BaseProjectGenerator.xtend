package com.laegler.microservice.model2code.template

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.template.PlantUmlComponentDiagram
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model2code.template.deployment.dockercompose.DockerComposeYaml
import com.laegler.microservice.model2code.template.env.gateway.GatewayProjectGenerator
import com.laegler.microservice.model2code.template.env.oauth2.OAuth2ProjectGenerator
import com.laegler.microservice.model2code.template.microservice.MicroserviceProjectGenerator
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.template.DotGraph

@Named
class BaseProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(BaseProjectGenerator)

//	@Inject CloudConfigProjectGenerator configProject
	@Inject GatewayProjectGenerator gatewayProject
	@Inject OAuth2ProjectGenerator oauth2Project
	@Inject MicroserviceProjectGenerator microserviceProject

	@Inject RootPomXml rootPomXml
	@Inject DotGitignore dotGitignore
	@Inject DockerComposeYaml dockerComposeYaml
	@Inject PlantUmlComponentDiagram plantUml
	@Inject DotGraph dotGraph

	def List<Project> generate(Architecture a) {
		LOG.debug('Generating Base project for architecture {}', a.name)

		Arrays.asList(
			a.generateBaseProject
		)
	}

	protected def Project generateBaseProject(Architecture a) {
		Project::builder //
		.name(namingStrategy.getProjectName(a.name)) //
		.basePackage(a.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name)) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects => [
				addAll(microserviceProject.generate(a))
				addAll(gatewayProject.generate(a))
				addAll(oauth2Project.generate(a))
//				addAll(configProject.generate(a))
			]
			p.templates => [
				add(rootPomXml.getTemplate(p))
				add(dotGitignore.getTemplate(p))
				add(dockerComposeYaml.getTemplate(p))
				add(plantUml.getTemplate(p))
				add(dotGraph.getTemplate(p))
			]
		]
	}

}

package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.template.PlantUmlComponentDiagram
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model2code.template.DockerComposeYaml
import com.laegler.microservice.model2code.template.DotGitignore
import com.laegler.microservice.model2code.template.RootPomXml
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class BaseProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(BaseProjectGenerator)

	@Inject ModelProjectGenerator modelProject
	@Inject BusinessProjectGenerator businessProject
//	@Inject SoapProjectGenerator soapProject
//	@Inject RestProjectGenerator restProject
	@Inject GrpcProjectGenerator grpcProject
	@Inject AppProjectGenerator appProject

	@Inject RootPomXml rootPomXml
	@Inject DotGitignore dotGitignore
	@Inject DockerComposeYaml dockerComposeYaml
	@Inject PlantUmlComponentDiagram plantUml

	override List<Project> generate(Architecture a) {
		log.debug('Generating Base project for architecture {}', a.name)

		Arrays.asList(
			a.generateBaseProject
		)
	}

	protected def Project generateBaseProject(Architecture a) {
		projectBuilder //
		.name(namingStrategy.getProjectName(a.name)) //
		.basePackage(a.basePackage) //
		.dir(namingStrategy.getProjectPath(a.name)) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects => [
				addAll(modelProject.generate(a))
				addAll(businessProject.generate(a))
//				addAll(soapProject.generate(a))
//				addAll(restProject.generate(a))
				addAll(grpcProject.generate(a))
				addAll(appProject.generate(a))
			]
			p.templates => [
				add(rootPomXml.getTemplate(p))
				add(dotGitignore.getTemplate(p))
				add(dockerComposeYaml.getTemplate(p))
				add(plantUml.getTemplate(p))
			]
		]
	}

}

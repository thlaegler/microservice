package com.laegler.microservice.model2code.generator

import gherkin.ast.GherkinDocument
import javax.inject.Inject
import com.laegler.microservice.model.microserviceModel.Artifact
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.Spring
import java.util.ArrayList
import java.util.List
import com.laegler.microservice.adapter.generator.AbstractGenerator
import javax.inject.Named
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.FileType

/**
 * Project Generator for JSF/Faces Project
 */
 @Named
class DocuProjectGenerator extends AbstractGenerator {

	List<Project> subProjects = new ArrayList
	List<Template> templates = new ArrayList

	override Project generate(Architecture a) {
		project = projectBuilder.name(a.name).microserviceModel(a).build
		world.projects.add(project)

		a.artifacts.filter(Spring).forEach [ s |
			s.name = s.name + '.docu'
			subProjects.addAll(
				s.generateDocuProject
			)
		]
		project
	}

	protected def Project generateDocuProject(Spring s) {
		var Project it = projectBuilder.name(s.name + '.docu').build
		templates.addAll(
			it.generatePlantUml
		)
		it
	}

	protected def Template generatePlantUml(Project project) {
		new PlantUmlTemplate(project)
	}

	protected def generateGrpcDefaultClientJava(Project project, Spring s) {
	}

	protected def generateGrpcClientJava(Project project, Spring s) {
		templateBuilder.fileName('''«s.name»GrpcClient''').fileType(FileType.XTEND).
			relativPath('''src/main/gen/«(project.microserviceModel as Architecture).basePackage»''').content('''
				This is the template of GrpcClient.java
			''').build.toFile
	}

	override prepare() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}

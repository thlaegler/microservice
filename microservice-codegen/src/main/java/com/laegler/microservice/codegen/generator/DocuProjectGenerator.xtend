package com.laegler.microservice.codegen.generator

import gherkin.ast.GherkinDocument
import javax.inject.Inject
import com.laegler.microservice.model.microserviceModel.Artifact
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.Spring
import com.laegler.microservice.codegen.template.base.BaseTemplate
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.FileHelper
import com.laegler.microservice.codegen.model.FileType
import java.util.ArrayList
import java.util.List
import com.laegler.microservice.codegen.model.ModelWrapper
import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.template.base.AbstractTemplate
import com.laegler.microservice.codegen.template.parent.docs.PlantUmlTemplate

/**
 * Project Generator for JSF/Faces Project
 */
class DocuProjectGenerator extends AbstractProjectGenerator {

	extension FileHelper fileHelper

	val List<Project> subProjects = new ArrayList
	var List<AbstractTemplate> templates = new ArrayList

	override Project generate(Architecture a) {
		project = projectBuilder.name(a.name).microserviceModel(a).build
		model.projects.add(project)

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

	protected def AbstractTemplate generatePlantUml(Project project) {
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

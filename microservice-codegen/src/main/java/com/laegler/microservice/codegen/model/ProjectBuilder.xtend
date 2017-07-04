package com.laegler.microservice.codegen.model

import java.util.Optional
import org.apache.maven.model.Model
import org.eclipse.emf.ecore.EObject
import com.laegler.microservice.model.microserviceModel.MicroserviceModelFactory
import javax.inject.Inject
import java.io.File

class ProjectBuilder {

	@Inject MicroserviceModelFactory microserviceModelFactory
	@Inject ModelAccessor modelAccessor

	var String name
	var ProjectType projectType
	var String basePackage
	var String version
	var String canonicalName
	var String documentation

	var String directory

	var Model pom
	var EObject microserviceModel

	new() {
	}

	def Project build() {
		Optional.ofNullable(name).orElse('undefined-project')
		Optional.ofNullable(projectType).orElse(ProjectType.UNDEFINED)
		Optional.ofNullable(basePackage).orElse('org.example.undefined')
		Optional.ofNullable(pom).orElse(new Model => [
			artifactId = name
			groupId = basePackage
		])
		Optional.ofNullable(microserviceModel).orElse(microserviceModelFactory.createSpring => [
			it.name = name
//				it.options.basePackage = this.basePackage
		])
		Optional.ofNullable(directory).orElse('undefined/' + name)
		Optional.ofNullable(version).orElse(modelAccessor.model.getOption('version')?.replaceFirst('v', ''))
		Optional.ofNullable(canonicalName).orElse('Undefined project')
		Optional.ofNullable(documentation).orElse('This is an undefined project (Generator is not implemented yet)')

		new Project(name, projectType, basePackage, version, canonicalName, documentation, directory, pom,
			microserviceModel)
	}

	def name(String name) {
		this.name = name
		this
	}

	def projectType(ProjectType projectType) {
		this.projectType = projectType
		this
	}

	def basePackage(String basePackage) {
		this.basePackage = basePackage
		this
	}

	def version(String version) {
		this.version = version
		this
	}

	def pom(Model pom) {
		this.pom = pom
		this
	}

	def microserviceModel(EObject microserviceModel) {
		this.microserviceModel = microserviceModel
		this
	}

	def dir(File directory) {
		this.directory = directory.absolutePath
		this
	}

	def dir(String directory) {
		this.directory = directory
		this
	}
}

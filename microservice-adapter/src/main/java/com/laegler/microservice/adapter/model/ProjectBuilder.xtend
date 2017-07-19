package com.laegler.microservice.adapter.model

import java.io.File
import java.util.ArrayList
import java.util.List
import java.util.Optional
import javax.inject.Named
import org.apache.maven.model.Model
import org.eclipse.emf.ecore.EObject

@Named
class ProjectBuilder {

	var String name
	var ProjectType projectType
	var String basePackage
	var String version
	var String canonicalName
	var String documentation

	var String directory

	var Model pom
	var Object microserviceModel
	
	var List<Project> subProjects
	var List<Template> templates

	new() {
	}

	def Project build() {
		Optional.ofNullable(name).orElse('undefined-project')
		Optional.ofNullable(projectType).orElse(ProjectType.UNDEFINED)
		Optional.ofNullable(basePackage).orElse('org.example.undefined')
		Optional.ofNullable(pom).orElse(new Model)
		Optional.ofNullable(microserviceModel)
		Optional.ofNullable(directory).orElse('undefined/' + name)
		Optional.ofNullable(version).orElse('0.0.1-SNAPSHOT')
		Optional.ofNullable(canonicalName).orElse('Undefined project')
		Optional.ofNullable(documentation).orElse('This is an undefined project (Generator is not implemented yet)')
		Optional.ofNullable(subProjects).orElse(new ArrayList)
		Optional.ofNullable(templates).orElse(new ArrayList)

		val project = new Project(name, projectType, basePackage, version, canonicalName, documentation, directory, pom,
			microserviceModel)
		project.subProjects = new ArrayList
		project.templates = new ArrayList
		project
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

	def microserviceModel(Object microserviceModel) {
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

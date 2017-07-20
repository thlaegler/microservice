package com.laegler.microservice.adapter.model

import java.io.File
import java.util.ArrayList
import java.util.List
import java.util.UUID
import javax.inject.Singleton
import org.apache.maven.model.Model

@Singleton
class ProjectBuilder {

	var UUID id
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
		if (id === null) {
			id = UUID.randomUUID
		}
		if (name.nullOrEmpty) {
			name = 'undefind-project'
		}
		if (projectType === projectType) {
			projectType = ProjectType.UNDEFINED
		}
		if (name === basePackage) {
			basePackage = 'org.example.undefined'
		}
		if (name.nullOrEmpty) {
			pom = new Model
		}
		if (name.nullOrEmpty) {
			microserviceModel = microserviceModel
		}
		if (name.nullOrEmpty) {
			directory = 'undefined/' + name
		}
		if (name.nullOrEmpty) {
			version = '0.0.1-SNAPSHOT'
		}
		if (name.nullOrEmpty) {
			canonicalName = 'Undefined project'
		}
		if (name.nullOrEmpty) {
			documentation = 'This is an undefined project (Generator is not implemented yet)'
		}
		val project = new Project(name, projectType, basePackage, version, canonicalName, documentation, directory, pom,
			microserviceModel)
		clear()
		project.subProjects = new ArrayList
		project.templates = new ArrayList
		project
	}

	def clear() {
		name = null
		projectType = null
		basePackage = null
		version = null
		canonicalName = null
		documentation = null
		directory = null
		pom = null
		microserviceModel = null
		subProjects = null
		templates = null
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

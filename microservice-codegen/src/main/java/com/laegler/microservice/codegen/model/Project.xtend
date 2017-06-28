package com.laegler.microservice.codegen.model

import com.laegler.microservice.codegen.template.base.AbstractTemplate
import java.io.File
import java.util.ArrayList
import java.util.List
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.model.Model
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@Data
@FinalFieldsConstructor
class Project {

	val String name
	val ProjectType projectType
	val String basePackage
	val String version
	val String canonicalName
	val String documentation

	val String directory

	val Model pom
	val EObject microserviceModel
	
	List<AbstractTemplate> templates = new ArrayList
	List<Project> subProjects = new ArrayList

	public def String getPackaging() {
		projectType.packaging
	}
	
	public static def ProjectBuilder getBuilder() {
		new ProjectBuilder
	}
}

class ProjectBuilder {

	private static val MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl
	private static val ModelWrapper model = ModelAccessor.model

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
		if (name == null) {
			name = 'undefined-project'
		}
		if (projectType == null) {
			projectType = ProjectType.UNDEFINED
		}
		if (basePackage == null) {
			basePackage = 'org.example.undefined'
		}
		if (pom == null) {
			pom = new Model => [
				artifactId = name
				groupId = basePackage
			]
		}
		if (microserviceModel == null) {
			microserviceModel = microserviceModelFactory.createSpring => [
				it.name = name
//				it.options.basePackage = this.basePackage
			]
		}
		if (directory == null) {
//			Files.createDirectory(Path.new Path('''undefined/«name»'''))
			directory = 'undefined/' + name
		}

		if (version == null) {
			version = model.getOption('version').replaceFirst('v', '')
		}
		if (canonicalName == null) {
			canonicalName = 'Undefined project'
		}
		if (documentation == null) {
			documentation = 'This is an undefined project (Generator is not implemented yet)'
		}

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

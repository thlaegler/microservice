package com.laegler.microservice.codegen.model

import com.laegler.microservice.codegen.template.utils.AbstractTemplate
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtend.lib.annotations.Data
import microserviceModel.MicroserviceModelFactory
import org.apache.maven.model.Model

@Data
//@Accessors
@FinalFieldsConstructor
class Project {

	val String name
	val Model pom
	val EObject model
	val File directory

	
	val String basePackage
	val String relativePath
	val String version
	val List<AbstractTemplate> files
	val ProjectType projectType
	val String canonicalName
	val String documentation

	new() {
		super()
		name = 'undefined-project'
		relativePath = '''undefined/«name»'''
		version = model.getOption('version').replaceFirst('v', '')
		dependencies = new ArrayList<String>
		files = new ArrayList<AbstractTemplate>
		projectType = ProjectType.UNDEFINED
		canonicalName = 'Undefined project'
		documentation = 'This is an undefined project (Generator is not implemented yet)'
	}

	public def String getPackaging() {
		projectType.packaging
	}
}

class ProjectBuilder {
	
	private static val MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	String name
	Model pom
	EObject model
	File directory

	new() {
	}

	def Project build() {
		if (this.name == null) {
			this.name = 'default-service'
		}
		if (this.pom == null) {
			this.pom = new Model => [artifactId = name]
		}
		if (this.model == null) {
			this.model = microserviceModelFactory.createArtifact => [it.name = name]
		}
		if (this.directory == null) {
			this.directory = new File('default-service')
		}
		new Project(this.name,this.pom,this.model, this.directory)
	}

	def name(String name) {
		this.name = name
		this
	}

	def pom(Model pom) {
		this.pom = pom
		this
	}

	def model(EObject model) {
		this.model = model
		this
	}

	def dir(File directory) {
		this.directory = directory
		this
	}
}


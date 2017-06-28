package com.laegler.microservice.codegen.model

import java.io.File
import java.util.ArrayList
import java.util.List
import microserviceModel.Architecture
import microserviceModel.MicroserviceModelFactory
import microserviceModel.Option
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.model.Model
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ModelWrapper {

	private static final MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	String name = 'default-project'
	File rootDirectory = new File('root/')

	Architecture architecture = microserviceModelFactory.createArchitecture
	Model mavenModel = new Model
	MavenProject mavenProject = new MavenProject(mavenModel)

	Project parentProject
	List<Project> projects = new ArrayList

	new() {
		val projectBuilder = new ProjectBuilder
		parentProject = projectBuilder.microserviceModel(architecture).build
	}

	public def String getOption(String key) {
		architecture.artifacts.filter(Option)?.findFirst[name == key]?.value
	}

	public def String getName() {
		if (mavenModel.artifactId != null) {
			mavenModel.artifactId
		}
		if (architecture.name != null) {
			architecture.name
		}
		if (rootDirectory != null) {
			rootDirectory.name
		}
		'unknown-project'
	}

	public def String getLabel() {
		if (mavenModel.artifactId != null) {
			mavenModel.artifactId
		}
		if (architecture.name != null) {
			architecture.name
		}
		if (rootDirectory != null) {
			rootDirectory.name
		}
		'unknown-project'
	}

}

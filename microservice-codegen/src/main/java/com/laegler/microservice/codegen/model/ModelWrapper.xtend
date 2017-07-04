package com.laegler.microservice.codegen.model

import java.io.File
import java.util.ArrayList
import java.util.List
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.MicroserviceModelFactory
import com.laegler.microservice.model.microserviceModel.Option
import com.laegler.microservice.model.microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.model.Model
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ModelWrapper {

//	MicroserviceModelFactory microserviceModelFactory

	String name3 = 'default-project'
	File rootDirectory = new File('root/')

	Architecture architecture
	Model mavenModel = new Model
	MavenProject mavenProject

	Project parentProject
	List<Project> projects = new ArrayList

	new() {
		projects = new ArrayList
//		microserviceModelFactory = new MicroserviceModelFactoryImpl
//		val projectBuilder = new ProjectBuilder
		mavenProject = new MavenProject(mavenModel)
//		architecture = microserviceModelFactory.createArchitecture
//		parentProject = projectBuilder.microserviceModel(microserviceModelFactory.createArchitecture).build
	}

	public def String getOption(String key) {
		architecture.artifacts.filter(Option).findFirst[name.equals(key)]?.value
	}

	public def String getName() {
		if (mavenModel.artifactId !== null) {
			mavenModel.artifactId
		}
		if (architecture.name !== null) {
			architecture.name
		}
		if (rootDirectory !== null) {
			rootDirectory.name
		}
		'unknown-project'
	}

	public def String getLabel() {
		if (mavenModel.artifactId !== null) {
			mavenModel.artifactId
		}
		if (architecture.name !== null) {
			architecture.name
		}
		if (rootDirectory !== null) {
			rootDirectory.name
		}
		'unknown-project'
	}

}

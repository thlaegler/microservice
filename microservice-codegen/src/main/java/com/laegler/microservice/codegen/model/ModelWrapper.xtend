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

class ModelWrapper {

	public var Architecture architecture
	public var Model mavenModel = new Model
	public var MavenProject mavenProject = new MavenProject(mavenModel)
	public var List<Microservice> microservices = new ArrayList
	public var File rootDirectory = new File('root/')

	private val MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	new() {
		architecture = microserviceModelFactory.createArchitecture
	}
	
	public def String getOption(String key) {
		architecture.artifacts.filter(Option)?.findFirst[name=='version']?.value
	}

}

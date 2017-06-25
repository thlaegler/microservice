package com.laegler.microservice.codegen.model

import org.apache.maven.model.Model
import java.io.File
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtend.lib.annotations.Data
import microserviceModel.Architecture
import org.eclipse.emf.ecore.EObject
import microserviceModel.Artifact
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.project.MavenProject

//@Data
//@Builder
class Microservice {
	
	public var String name = 'default-service'
	public var Model pom = new Model
	public var EObject model = microserviceModelFactory.createArtifact
	public var File directory = new File('default-service')

	private static val MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl
}

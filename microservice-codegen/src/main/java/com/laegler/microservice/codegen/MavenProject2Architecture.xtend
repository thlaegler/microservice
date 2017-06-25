package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.project.MavenProject

class MavenProject2Architecture extends AbstractTransformator {
	
	val ModelWrapper model = ModelAccessor.model
	
	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	override transform(MavenProject parentProject) {
		super.transform(parentProject)
	}
	
}

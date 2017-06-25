package com.laegler.microservice.codegen

import microserviceModel.Architecture
import microserviceModel.Spring
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper

class Architecture2MavenProject extends AbstractTransformator {
		
	val ModelWrapper model = ModelAccessor.model
	
	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl
	
	override transform(Architecture architecture) {
		super.transform(architecture)
	}
	
	override public String getPlantumlGraphFileContent(Architecture model) {
		super.getPlantumlGraphFileContent(model)
	}
	
}

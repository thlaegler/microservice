package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl

class Architecture2Documentation extends AbstractTransformator {

	val ModelWrapper model = ModelAccessor.model
	
	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

}

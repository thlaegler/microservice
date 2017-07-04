package com.laegler.microservice.codegen.model

import javax.inject.Singleton

@Singleton
class ModelAccessor {

	private static ModelWrapper model

	public def ModelWrapper getModel() {
		if(model === null) {
			model = new ModelWrapper
		}
		model
	}
}

package com.laegler.microservice.codegen.model

class ModelAccessor {
	
	private static ModelWrapper MODEL = new ModelWrapper
	
	public static def ModelWrapper getModel() {
		MODEL
	}
}
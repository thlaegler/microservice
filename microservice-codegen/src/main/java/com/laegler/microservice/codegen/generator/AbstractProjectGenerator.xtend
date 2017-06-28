package com.laegler.microservice.codegen.generator

import com.laegler.microservice.codegen.model.Project
import microserviceModel.Architecture
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.codegen.model.ModelWrapper
import com.laegler.microservice.codegen.model.ModelAccessor

/**
 * Abstract project generator.
 */
abstract class AbstractProjectGenerator {
	
	protected static Logger LOG = LoggerFactory.getLogger(AbstractProjectGenerator)

	protected ModelWrapper model = ModelAccessor.model

	protected Project project
	
	abstract public def Project prepare()
	
	abstract public def Project generate(Architecture a)

}

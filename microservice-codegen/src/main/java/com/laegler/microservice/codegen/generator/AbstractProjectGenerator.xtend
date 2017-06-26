package com.laegler.microservice.codegen.generator

import java.util.logging.Logger
import javax.inject.Inject
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collection
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.Microservice

/**
 * Abstract project generator.
 */
abstract class AbstractProjectGenerator {
	
	@Inject protected Logger log

	@Accessors
	private Microservice microservice
	
	@Accessors
	private Project project
	
	abstract public def Project prepare()

	protected def boolean isNullOrEmpty2(Object object) {
		if(object instanceof Collection) {
			return object != null && !object.empty
		}
		if(object instanceof String) {
			return object != null && !object.empty
		}
		return object != null
	}

}

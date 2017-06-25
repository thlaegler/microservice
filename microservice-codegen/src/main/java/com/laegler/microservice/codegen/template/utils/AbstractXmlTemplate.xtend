package com.laegler.microservice.codegen.template.utils

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.Microservice

/**
 * Abstract super type for all XML files.
 */
abstract class AbstractXmlTemplate extends AbstractTemplate {

	new(Microservice m) {
		super(m)
		this.fileType = FileType.XML
	}
	
	new(Project project) {
		super(project)
		this.fileType = FileType.XML
	}

}

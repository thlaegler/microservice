package com.laegler.microservice.adapter.model

import javax.annotation.PostConstruct
import org.slf4j.Logger
import org.slf4j.LoggerFactory

abstract class Java {

	protected static final Logger LOG = LoggerFactory.getLogger(Java)

	protected Template.Builder templateBuilder

	@PostConstruct
	public def void prepareTemplateBuilder() {
		templateBuilder = Template::builder //
		.fileType(FileType.JAVA) //
		.documentation('Java file') //
		.skipStamping(false) //
	}
	
}

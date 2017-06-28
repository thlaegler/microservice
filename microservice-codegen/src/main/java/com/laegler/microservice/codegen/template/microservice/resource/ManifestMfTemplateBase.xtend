package com.laegler.microservice.codegen.template.microservice.resource

import com.laegler.microservice.codegen.template.base.BaseTemplate
import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.base.AbstractTemplate

/**
 * File Generator for OSGi Manifest descriptor (MANIFEST.MF)
 */
class ManifestMfTemplateBase extends AbstractTemplate {

	new(Project p) {
		super(p)
		fileType = FileType.MANIFEST
		fileName = 'MANIFEST'
		relativPath = '/src/main/resource/META-INF/'
		documentation = 'OSGi Manifest descriptor'

		content = template
	}

	private def String getTemplate() '''
		Manifest-Version: 1.0
		Class-Path: 
		
	'''

}

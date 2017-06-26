package com.laegler.microservice.codegen.template.microservice.resource

import com.laegler.microservice.codegen.template.utils.AbstractTemplate
import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Microservice

/**
 * File Generator for OSGi Manifest descriptor (MANIFEST.MF)
 */
class ManifestMfTemplateBase extends AbstractTemplate {

	new(Microservice m) {
		super(m)
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

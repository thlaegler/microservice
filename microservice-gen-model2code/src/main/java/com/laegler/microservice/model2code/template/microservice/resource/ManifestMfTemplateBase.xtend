//package com.laegler.microservice.model2code.template.microservice.resource
//
//import com.laegler.microservice.model2code.template.base.BaseTemplate
//import com.laegler.microservice.adapter.util.FileType
//import com.laegler.microservice.adapter.util.Project
//import com.laegler.microservice.model2code.template.base.AbstractTemplate
//
///**
// * File Generator for OSGi Manifest descriptor (MANIFEST.MF)
// */
//class ManifestMfTemplateBase extends AbstractTemplate {
//
//	new(Project p) {
//		super(p)
//		fileType = FileType.MANIFEST
//		fileName = 'MANIFEST'
//		relativPath = '/src/main/resource/META-INF/'
//		documentation = 'OSGi Manifest descriptor'
//
//		content = template
//	}
//
//	private def String getTemplate() '''
//		Manifest-Version: 1.0
//		Class-Path: 
//		
//	'''
//
//}

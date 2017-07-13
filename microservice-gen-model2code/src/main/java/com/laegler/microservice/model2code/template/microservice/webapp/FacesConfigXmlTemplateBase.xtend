package com.laegler.microservice.model2code.template.microservice.webapp

import com.laegler.microservice.model2code.template.base.AbstractXmlTemplate
import com.laegler.microservice.adapter.util.Project

/**
 * File Generator for Java Faces descriptor.
 */
class FacesConfigXmlTemplateBase extends AbstractXmlTemplate {

	new(Project m) {
		super(m)
		fileName = 'faces-config'
		relativPath = '/src/main/webapp/META-INF/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<faces-config
			    xmlns="http://xmlns.jcp.org/xml/ns/javaee"
			    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			    xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
			    	http://xmlns.jcp.org/xml/ns/javaee/web-facesconfig_2_2.xsd"
			    version="2.2">
		'''
		footer = '</faces-config>'
		documentation = 'Java Faces descriptor'

		content = template
	}

	private def String getTemplate() '''
		<!-- TODO -->
	'''

}

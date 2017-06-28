package com.laegler.microservice.codegen.template.microservice.resource

import com.laegler.microservice.codegen.template.base.AbstractXmlTemplate
import com.laegler.microservice.codegen.model.Project

/**
 * File Generator for EJB descriptor (ejb-jar.xml)
 */
class EjbJarXmlTemplateBase extends AbstractXmlTemplate {

	new(Project m) {
		super(m)
		fileName = 'ejb-jar'
		relativPath = '/src/main/resource/META-INF/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<ejb-jar
				version="3.0"
				xmlns="http://java.sun.com/xml/ns/javaee"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
					http://java.sun.com/xml/ns/javaee/ejb-jar_3_0.xsd">
		'''
		footer = '</ejb-jar>'
		documentation = 'EJB descriptor'
	}

}

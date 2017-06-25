package templates._common.src_main_resource.meta_inf

import com.laegler.stubbr.lang.genmodel.Project
import templates.AbstractXmlTemplate
import com.laegler.stubbr.lang.generator.repository.StubbrRegistry

/**
 * File Generator for EJB descriptor.
 */
class BeansXmlTemplateBase extends AbstractXmlTemplate {

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project) {
		super(stubbr, project)
		fileName = 'beans'
		relativPath = '/src/main/webapp/META-INF/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<beans
				xmlns="http://xmlns.jcp.org/xml/ns/javaee"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
					http://xmlns.jcp.org/xml/ns/javaee/beans_1_1.xsd"
				version="1.1"
				bean-discovery-mode="annotated">
		'''
		footer = '</beans>'
		documentation = 'EJB descriptor'
	}

}

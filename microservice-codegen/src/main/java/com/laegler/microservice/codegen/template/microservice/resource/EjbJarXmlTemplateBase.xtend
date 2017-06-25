package templates._common.src_main_resource.meta_inf

import com.laegler.stubbr.lang.genmodel.Project
import templates.AbstractXmlTemplate
import com.laegler.stubbr.lang.generator.repository.StubbrRegistry

/**
 * File Generator for EJB descriptor (ejb-jar.xml)
 */
class EjbJarXmlTemplateBase extends AbstractXmlTemplate {

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project) {
		super(stubbr, project)
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

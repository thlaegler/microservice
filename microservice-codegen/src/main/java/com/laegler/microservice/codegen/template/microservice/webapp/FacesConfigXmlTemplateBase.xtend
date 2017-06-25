package templates._common.src_main_webapp.web_inf

import com.laegler.stubbr.lang.genmodel.Project
import templates.AbstractXmlTemplate
import com.laegler.stubbr.lang.generator.repository.StubbrRegistry

/**
 * File Generator for Java Faces descriptor.
 */
class FacesConfigXmlTemplateBase extends AbstractXmlTemplate {

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project) {
		super(stubbr, project)
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

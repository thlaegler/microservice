package com.laegler.microservice.codegen.template.microservice.src.soap.server

import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.utils.AbstractXtendTemplate

/**
 * File template for SOAP endpoint publisher.
 */
class DefaultSoapEndpointPublisherXtendTemplate extends AbstractXtendTemplate {

	new(Project project) {
		super(project)
		fileName = 'SoapEndpointPublisher'
		relativPath = '''/src/main/java/«project?.basePackage?.toPath»/'''
		documentation = 'SOAP endpoint publisher'

		content = template
	}

	private def String getTemplate() '''
		package «project?.basePackage»
		
		import «project?.basePackage».*
		import javax.inject.Inject
		import javax.xml.ws.Endpoint
		
		«javaDocType»
		public class «fileName» {
			
			/**
			 * Publish all Endpoints.
			 */
			public static void main(String[] args) {
«««				«FOR Entity entity : project.entities»
«««					Endpoint.publish('http://localhost:9999/ws/«entity?.name?.toLowerCase»', new «entity?.name?.toFirstUpper»SoapImpl())
«««				«ENDFOR»
			}
		
		}
	'''
}

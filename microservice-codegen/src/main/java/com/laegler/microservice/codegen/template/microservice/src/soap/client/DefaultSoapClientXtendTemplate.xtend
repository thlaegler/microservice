package com.laegler.microservice.codegen.template.microservice.src.soap.client

import com.laegler.microservice.model.microserviceModel.Entity
import com.laegler.microservice.codegen.template.base.AbstractXtendTemplate
import com.laegler.microservice.codegen.model.Project

/**
 * File template for SOAP client.
 */
class DefaultSoapClientXtendTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»SoapClient'''
		relativPath = '''/src/main/java/«project?.basePackage?.toPath»/'''
		documentation = '''SOAP client for entity «entity?.name?.toFirstUpper»'''

		content = template
	}

	private def String getTemplate() '''
		package «project?.basePackage»
		
		import «project?.basePackage».*
		import «model.getOption('packageName')».soap.server.*
		import java.net.URL
		import javax.xml.namespace.QName
		import javax.xml.ws.Service
		
		«javaDocType»
		public class «fileName» {
		
			/**
			 * Call SOAP Endpoint for Entity «entity?.name?.toFirstUpper».
			 */
			public def static void main(String[] args) throws Exception {
				val «fileName» client = new «fileName»()
				val «entity?.name?.toFirstUpper»Soap port = client.getPort()
			}
		
			/**
			 * Get the SOAP Service.
			 */
			public def «entity?.name?.toFirstUpper»Soap getPort() {
				val URL url = new URL('http://localhost:9999/ws/«entity?.name?.toLowerCase»?wsdl')
				val QName qname = new QName('«(model.getOption('packageName') + '.' + entity?.name).toNamespace»', '«entity?.name?.toFirstUpper»SoapImpl')
				val Service service = Service.create(url, qname)
				return service.getPort(«entity?.name?.toFirstUpper»Soap)
			}
		
		}
	'''
}

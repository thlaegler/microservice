package com.laegler.microservice.model2code.template.microservice.src.soap.server

import com.laegler.microservice.model.microserviceModel.Entity
import com.laegler.microservice.model2code.template.base.AbstractXtendTemplate
import com.laegler.microservice.adapter.util.Project
import com.laegler.microservice.model.microserviceModel.Attribute

/**
 * File template for SOAP endpoint interface.
 */
class DefaultSoapEndpointInterfaceXtendTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»Soap'''
		relativPath = '''/src/main/java/«project?.basePackage?.toPath»/'''
		documentation = '''SOAP endpoint interface for entity «entity?.name?.toFirstUpper»'''

		content = template
	}

	private def String getTemplate() '''
		package «project?.basePackage»
		
		import «project?.basePackage».*
		import javax.jws.WebMethod
		import javax.jws.WebService
		import javax.jws.soap.SOAPBinding
		import javax.jws.soap.SOAPBinding.Style
		
		«javaDocType»
		@WebService
		@SOAPBinding(style = Style.DOCUMENT, use=Use.LITERAL)
		public interface «fileName» {
		
			/**
			 * Get «entity?.name?.toFirstUpper» with given ID.
			 */
			@WebMethod
			def public String «entity?.name?.toFirstLower»Get(«FOR Attribute attribute : entity?.attributes»
«««			«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
			«attribute?.type?.name»
«««			«ENDIF»
			 «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext)		
			/**
			 * Create new «entity?.name?.toFirstUpper».
			 */
			@WebMethod
			def public String «entity?.name?.toFirstLower»Post(«FOR Attribute attribute : entity?.attributes»
«««			«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
			«attribute?.type?.name»
«««			«ENDIF»
			 «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext)		
			/**
			 * Update given «entity?.name?.toFirstUpper».
			 */
			@WebMethod
			def public String «entity?.name?.toFirstLower»Put(«FOR Attribute attribute : entity?.attributes»
«««			«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
			«attribute?.type?.name»
«««			«ENDIF»
			 «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext)		
			/**
			 * Delete given «entity?.name?.toFirstUpper».
			 */
			@WebMethod
			def public String «entity?.name?.toFirstLower»Delete(«FOR Attribute attribute : entity?.attributes»
«««			«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
			«attribute?.type?.name»
«««			«ENDIF»
			 «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext)
		
		}
	'''
}

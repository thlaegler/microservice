package com.laegler.microservice.codegen.template.microservice.gen.soap.server

import microserviceModel.Entity
import com.laegler.microservice.codegen.template.utils.AbstractXtendTemplate
import com.laegler.microservice.codegen.model.Project
import microserviceModel.Attribute

/**
 * File template for SOAP endpoint implementation.
 */
class DefaultSoapEndpointImplXtendTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»SoapImpl'''
		relativPath = '''/src/main/java/«project?.basePackage?.toPath»/impl/'''
		documentation = '''SOAP endpoint implementation for entity «entity?.name?.toFirstUpper»'''

		content = template
	}

	private def String getTemplate() '''
		package «project?.basePackage».impl
		
		import «project?.basePackage».*
		import javax.inject.Inject
		import javax.jws.WebMethod
		import javax.jws.WebService
		import javax.jws.soap.SOAPBinding
		import javax.jws.soap.SOAPBinding.Style
		
		«javaDocType»
		@WebService
		@SOAPBinding(style = Style.DOCUMENT, use=Use.LITERAL)
		public class «fileName» implements «entity?.name?.toFirstUpper»Soap {
		
			@Inject
			private «entity?.name?.toFirstUpper»ServiceGen «entity?.name?.toFirstLower»Service
		
			/**
			 * Get «entity?.name?.toFirstUpper» with given ID.
			 */
«««			override def public String «entity?.name?.toFirstLower»Get(«FOR Attribute attribute : entity?.attributes»«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»«attribute?.type?.name»«ENDIF» «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext) {
«««			val «entity?.name.toFirstUpper» «entity?.name.toFirstLower» = «entity?.name?.toFirstLower»ServiceGen».findOne(Long.parse(id))
«««			return «entity?.name.toFirstUpper»
«««			}
		
			/**
			 * Create new «entity?.name?.toFirstUpper».
			 */
«««			override def public String «entity?.name?.toFirstLower»Post(«FOR Attribute attribute : entity?.attributes»«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»«attribute?.type?.name»«ENDIF» «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext) {
«««			
«««			}
		
			/**
			 * Update given «entity?.name?.toFirstUpper».
			 */
«««			override def public String «entity?.name?.toFirstLower»Put(«FOR Attribute attribute : entity?.attributes»«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»«attribute?.type?.name»«ENDIF» «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext) {
«««			
			}
		
			/**
			 * Delete given «entity?.name?.toFirstUpper».
			 */
			override def public String «entity?.name?.toFirstLower»Delete(«FOR Attribute attribute : entity?.attributes»
«««			«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
			«attribute?.type?.name»
«««			«ENDIF»
			 «attribute?.name?.toFirstLower», «ENDFOR»SecurityContext securityContext) {
			«entity?.name?.toFirstLower»ServiceGen».delete(Long.parse(id))
			return 'removed «entity?.name?.toFirstUpper»'
			}
		}
	'''
}

package com.laegler.microservice.codegen.template.microservice.src.persistence.model

import com.laegler.microservice.codegen.template.base.AbstractXtendTemplate
import microserviceModel.Entity
import com.laegler.microservice.codegen.model.Project
import microserviceModel.Attribute

/**
 * File template for entity.
 */
class EntityTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»'''
		relativPath = '''src/main/java/«project?.basePackage?.toPath»/entity'''
		documentation = '''entity «entity?.name?.toFirstUpper»'''

		this.content = template
	}

	private def String getTemplate() '''
		package «project.basePackage».entity
		
		import «project.basePackage».*
		import java.io.Serializable
		import javax.persistence.Id
		import javax.persistence.Column
		import javax.persistence.Entity
		import javax.persistence.GeneratedValue
		import javax.persistence.GenerationType
		import javax.persistence.Table
		import javax.xml.bind.annotation.XmlElement
		import javax.xml.bind.annotation.XmlRootElement
		import org.eclipse.xtend.lib.annotations.Accessors
		import org.hibernate.annotations.Cache
		import org.hibernate.annotations.CacheConcurrencyStrategy
		import com.google.gson.annotations.Expose
		«javaDocType»
		@Accessors
		@Entity
		@Table(name = "«entity?.name?.toLowerUnderscore»")
		@XmlRootElement
		//@ApiModel(description = "«documentation».")
		@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
		interface «fileName» implements Serializable {
		
			«FOR Attribute attribute : entity?.attributes»
				
				/**
				 * «attribute?.documentation»
				 */
				«IF attribute.primaryKey»
					@Id
					@GeneratedValue(strategy = GenerationType.AUTO)
				«ENDIF»
				@Column(name='«attribute?.name?.toLowerUnderscore»')
				//@Since(«model.getOption('version')»)
				@Until(0.0)
				//@JsonProperty('«attribute?.name?.toFirstLower»')
				@XmlElement
				@Expose(serialize=true, deserialize=true)
				@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
				private 
«««				«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
				«attribute?.type?.name»
«««				«ENDIF»
				 «attribute?.name?.toFirstLower»
			«ENDFOR»
		
		}
	'''

}

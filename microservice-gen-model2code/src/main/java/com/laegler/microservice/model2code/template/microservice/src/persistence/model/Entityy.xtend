package com.laegler.microservice.model2code.template.microservice.src.persistence.model

import com.laegler.microservice.model.microserviceModel.Attribute
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.Xtend
import org.slf4j.Logger
import com.laegler.microservice.model.microserviceModel.Entity

class Entityy extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(Entityy)

	Entity entity

	public def Template getTemplate(Project project, Entity entity) {
		LOG.debug('Generate template DefaultEntity')

		this.entity=entity

		templateBuilder //
		.project(project) //
		.fileName(entity?.name?.toFirstUpper) //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getAbsoluteSourcePath(project.name) + '/entity') //
		.documentation('''Entity «entity?.name?.toFirstUpper»''').skipStamping(true) //
		.content('''
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
			«project.javaDocType»
			@Accessors
			@Entity
			@Table(name = "«entity.name»")
			@XmlRootElement
			//@ApiModel
			@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
			interface «entity?.name?.toFirstUpper» implements Serializable {
			
				«FOR Attribute attribute : entity?.attributes»
					
					/**
					 * «attribute?.documentation»
					 */
					«IF attribute.primaryKey»
						@Id
						@GeneratedValue(strategy = GenerationType.AUTO)
					«ENDIF»
					@Column(name='«attribute.name»')
					//@Since(«world.getOption('version')»)
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
		''')//
		.build
	}

}

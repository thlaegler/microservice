package com.laegler.microservice.model2code.template.microservice.gen.persistence.model

import com.laegler.microservice.model.Entity
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.Xtend
import org.slf4j.Logger
import java.util.Map
import java.util.Map.Entry

class DefaultEntity extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(DefaultEntity)

	Entity entity

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template DefaultEntity')

		this.entity = entity
		
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
			«FOR Map<String, String> field : entity.fields»
				«FOR Entry<String, String> e : field.entrySet»
					/**
					 * «e.key»
					 */
«««					«IF attribute.primaryKey»
«««						@Id
«««						@GeneratedValue(strategy = GenerationType.AUTO)
«««					«ENDIF»
					@Column(name='«e.key»')
					//@Since(«world.getOption('version')»)
					@Until(0.0)
					//@JsonProperty('«e.key.toFirstLower»')
					@XmlElement
					@Expose(serialize=true, deserialize=true)
					@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
					private 
	«««				«IF attribute?.javaType != null»«attribute?.javaType?.qualifiedName»«ELSE»
					«e.value»
	«««				«ENDIF»
					 «e.key.toFirstLower»
				«ENDFOR»
			«ENDFOR»
			}
		''')//
		.build
	}

}

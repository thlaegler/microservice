package com.laegler.microservice.model2code.template.microservice.model.src

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import com.laegler.microservice.model.Entity
import java.util.Map.Entry
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class EntityXtend extends Xtend {

	protected static final Logger log = LoggerFactory.getLogger(EntityXtend)

	Entity entity

	public def Template getTemplate(Project project, Entity entity) {
		val path = namingStrategy.getSrcPathWithPackage(project) + '/entity'
		log.debug('  Generate template {}/{}.xtend',path, entity.name)

		this.entity = entity

		templateBuilder //
		.project(project) //
		.fileName(entity?.name?.toFirstUpper) //
		.fileType(FileType.XTEND) //
		.relativPath(path) //
		.documentation('EntityXtend')//
		.skipStamping(true) //
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
			class «entity?.name?.toFirstUpper» implements Serializable {
			
				«FOR Entry<String, String> field : entity?.fields?.entrySet»
					/**
					 * «field.key»
					 */
«««						«IF field.primaryKey»
«««							@Id
«««							@GeneratedValue(strategy = GenerationType.AUTO)
«««						«ENDIF»
					@Column(name='«field.key»')
					//@Since(«world.getOption('version')»)
					@Until(0.0)
					//@JsonProperty('«field.key.toFirstLower»')
					@XmlElement
					@Expose(serialize=true, deserialize=true)
					@Accessors(PUBLIC_GETTER, PUBLIC_SETTER)
					«field.value» «field.key.toFirstLower»
					
				«ENDFOR»
			}
		''') //
		.build
	}

}

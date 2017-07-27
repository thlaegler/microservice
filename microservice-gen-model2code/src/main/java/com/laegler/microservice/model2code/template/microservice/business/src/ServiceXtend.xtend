package com.laegler.microservice.model2code.template.microservice.business.src

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
class ServiceXtend extends Xtend {

	protected static final Logger log = LoggerFactory.getLogger(ServiceXtend)

	Entity entity

	public def Template getTemplate(Project p, Entity entity) {
		val path = namingStrategy.getSrcPathWithPackage(p) + '/entity'
		log.debug('  Generate template {}/{}.xtend',path, entity.name)

		this.entity = entity

		templateBuilder //
		.project(p) //
		.fileName(entity?.name?.toFirstUpper + 'Service') //
		.fileType(FileType.XTEND) //
		.relativPath(path) //
		.documentation('EntityXtend')//
		.skipStamping(true) //
		.content('''
			package «p.basePackage».entity
			
			import «p.basePackage».*
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
			import org.slf4j.Logger
			import org.slf4j.LoggerFactory
			«p.javaDocType»
			@Accessors
			@Service
			class «entity?.name?.toFirstUpper»Service {
				
				@Autowired(required=false)
				Logger log
				
				@Autowired
				«entity?.name?.toFirstUpper»JpaRepository jpaRepo
			
				«FOR Entry<String, String> field : entity?.fields?.entrySet»
					/**
					 * «field.key» Service
					 */
					//@Since(«world.getOption('version')»)
					@Until(0.0)
					public def «entity?.name?.toFirstUpper» get«entity?.name?.toFirstUpper»ById(«field.value» «field.key.toFirstLower») {
						log.debug('Calling get«entity?.name?.toFirstUpper»By«field.key.toFirstLower»({})', «field.key.toFirstLower»)
						
						jpaRepo.findBy«field.key.toFirstUpper»(«field.key.toFirstLower»)
					}
					
				«ENDFOR»
			}
		''') //
		.build
	}

}

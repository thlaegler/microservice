package com.laegler.microservice.model2code.template.microservice.model.src.repo.jpa

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import com.laegler.microservice.model.Entity
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class JpaRepoXtend extends Xtend {

	protected static final Logger log = LoggerFactory.getLogger(JpaRepoXtend)

	Entity entity

	public def Template getTemplate(Project project, Entity entity) {
		val path = namingStrategy.getSrcPathWithPackage(project) + '/entity'
		log.debug('  Generate template {}/{}.xtend',path, entity.name)

		this.entity = entity

		Template::builder //
		.project(project) //
		.fileName(entity?.name?.toFirstUpper + 'JpaRepository') //
		.fileType(FileType.XTEND) //
		.relativPath(path) //
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
			@Repository
			interface «entity?.name?.toFirstUpper»JpaRepository implements JpaRepository<«entity?.name?.toFirstUpper», Long> {
			}
		''') //
		.build
	}

}

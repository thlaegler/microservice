package com.laegler.microservice.model2code.template.microservice.gen.persistence.repository

import com.laegler.microservice.model.microserviceModel.Entity
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import org.slf4j.LoggerFactory
import org.slf4j.Logger

class DefaultJpaRepositoryXtend extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(DefaultJpaRepositoryXtend)

	Entity entity

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template DefaultJpaRepositoryXtend')

		this.entity = entity

		templateBuilder //
		.project(project) //
		.fileName(entity?.name?.toFirstUpper + 'Repository') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getAbsoluteSourcePath(project.name) + '/repository') //
		.documentation('''Custom persistence repository for managing entity «entity?.name?.toFirstUpper»''') //
		.content('''
			package «project.basePackage».repository
			
			import «project.basePackage».*
			import «world.getOption('packageName')».model.entity.*
			import org.springframework.data.jpa.repository.*
			import java.util.List
			
			«project.javaDocType»
			public interface «entity?.name?.toFirstUpper + 'Repository'» extends JpaRepository<«entity?.name.toFirstUpper», Long> {}
		''') //
		.build
	}

}

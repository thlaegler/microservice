package com.laegler.microservice.codegen.template.microservice.src.grpc.server

import com.laegler.microservice.codegen.template.base.AbstractXtendTemplate
import microserviceModel.Entity
import com.laegler.microservice.codegen.model.Project

/**
 * File template for custom persistence repository for managing entity.
 */
class GrpcServerXtendTemplate extends AbstractXtendTemplate {

	private Entity entity

	new(Project project, Entity entity) {
		super(project)
		this.entity = entity
		fileName = '''«entity?.name?.toFirstUpper»Repository'''
		relativPath = '''/src-gen/main/java/«project?.basePackage?.toPath»/repository/'''
		header = '''package «project.basePackage».repository'''
		documentation = '''Custom persistence repository for managing entity «entity?.name?.toFirstUpper»'''

		content = template
	}

	private def String getTemplate() '''
		package «project.basePackage».repository
		
		import «project.basePackage».*
		import «model.getOption('packageName')».model.entity.*
		import org.springframework.data.jpa.repository.*
		import java.util.List
		
		«javaDocType»
		public interface «fileName» extends JpaRepository<«entity?.name.toFirstUpper», Long> {}
	'''

}

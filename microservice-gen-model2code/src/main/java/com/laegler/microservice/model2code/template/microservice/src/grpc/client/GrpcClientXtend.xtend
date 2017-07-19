package com.laegler.microservice.model2code.template.microservice.src.grpc.client

import com.laegler.microservice.model.Entity
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.Xtend

class GrpcClientXtend extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(GrpcClientXtend)

	Entity entity

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template GrpcClientXtend')

		this.entity = entity

		templateBuilder //
		.project(project) //
		.fileName(entity.name?.toLowerCase.replaceAll(' ', '').toFirstUpper + 'GrpcClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getAbsoluteSourcePath(project.name) + '/client') //
		.documentation('''gRPC client for entity «entity?.name?.toFirstUpper» - «entity?.name?.replaceAll('"', '')»''') //
		.skipStamping(true) //
		.content('''
			package «project.basePackage».client
			
			import «project.basePackage».*
			import «world.getOption('packageName')».model.entity.*
			import org.springframework.data.jpa.repository.*
			import java.util.List
			
			«project.javaDocType»
			class «entity.name?.toLowerCase.replaceAll(' ', '').toFirstUpper + 'GrpcClient'» extends Default«entity.name?.toLowerCase.replaceAll(' ', '').toFirstUpper + 'GrpcClient'» {
				
			}
		''') //
		.build
	}

}

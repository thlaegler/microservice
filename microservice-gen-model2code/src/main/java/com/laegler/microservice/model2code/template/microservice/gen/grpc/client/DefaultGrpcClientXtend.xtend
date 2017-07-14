package com.laegler.microservice.model2code.template.microservice.gen.grpc.client

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Named
import com.laegler.microservice.adapter.model.Xtend
import org.slf4j.LoggerFactory
import org.slf4j.Logger

@Named
class DefaultGrpcClientXtend extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(DefaultGrpcClientXtend)

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template DefaultGrpcClientXtend')

		templateBuilder //
		.project(project) //
		.fileName('''«project.name?.toFirstUpper»Repository''') //
		.fileType(FileType.GITIGNORE) //
		.relativPath(namingStrategy.getAbsoluteGeneratedSourcePath(project.name) + '/client') //
		.documentation('Default gRPC client Xtend template') //
		.content('''
			package «project.basePackage».client
			
			import «project.basePackage».*
			import org.springframework.data.jpa.repository.*
			import java.util.List
			
			«project.javaDocType»
			class Default«project.name»GrpcClientRepository {
				
			}
		''')//
		.build
	}
	
	

}

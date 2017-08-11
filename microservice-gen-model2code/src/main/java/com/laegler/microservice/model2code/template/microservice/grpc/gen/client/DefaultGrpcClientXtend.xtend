package com.laegler.microservice.model2code.template.microservice.grpc.gen.client

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

	public def Template getTemplate(Project p) {
		LOG.debug('Generate template DefaultGrpcClientXtend')

		Template::builder //
		.project(p) //
		.fileName('Default' + p.name?.replaceAll('.', '').toFirstUpper + 'GrpcClient2') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcGenPathWithPackage(p) + '/client2') //
		.documentation('Default gRPC client Xtend template') //
		.content('''
			package «p.basePackage».client
			
			import «p.basePackage».*
			import org.springframework.data.jpa.repository.*
			import java.util.List
			
			«p.javaDocType»
			class Default«p.name»GrpcClient2 {
				
			}
		''') //
		.build
	}

}

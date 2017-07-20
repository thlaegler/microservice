package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.microservice.grpc.GrpcPomXml
import com.laegler.microservice.model2code.template.microservice.grpc.gen.client.DefaultGrpcClientXtend
import com.laegler.microservice.model2code.template.microservice.grpc.res.GrpcProto
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class GrpcProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(GrpcProjectGenerator)

	@Inject GrpcPomXml grpcPomXml
	@Inject GrpcProto grpcProto
	@Inject DefaultGrpcClientXtend defaultGrpcClientXtend

	override List<Project> generate(Architecture a) {
		log.debug('Generating gRPC project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateGrpcProject)
		]
		projects
	}

	protected def Project generateGrpcProject(Artifact a) {
		log.debug('Generating gRPC project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(a.name, 'grpc')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(a.name+'/grpc')) //
		.microserviceModel(a)//
		.build => [ p |
			p.subProjects?.addAll(
				generateGrpcParentProject(p,a),
				generateGrpcModelProject(p,a),
				generateGrpcServerProject(p,a),
				generateGrpcClientProject(p,a)
			)
			p.templates?.add(grpcPomXml.getTemplate(p))
		]
	}

	protected def Project generateGrpcParentProject(Project parent, Artifact a) {
		log.debug('Generating gRPC parent project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(parent.name, 'parent')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(parent.name+'/parent')) //
		.microserviceModel(a)//
		.build => [ p |
//			p.templates?.addAll(
//				grpcModelPomXml.getTemplate(p)
//			)
		]
	}

	protected def Project generateGrpcModelProject(Project parent, Artifact a) {
		log.debug('Generating gRPC model project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(parent.name, 'model')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(parent.name+'/model')) //
		.microserviceModel(a)//
		.build => [ p |
			p.templates?.addAll(
				grpcProto.getTemplate(p, a),
				p.generateGrpcModelXtend(a)
			)
		]
	}

	protected def Project generateGrpcServerProject(Project parent, Artifact a) {
		log.debug('Generating gRPC server project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(parent.name, 'server')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(parent.name+'/server')) //
		.microserviceModel(a)//
		.build => [ p |
			p.templates?.addAll(
				p.generateGrpcDefaultServerXtend(a),
				p.generateGrpcServerXtend(a)
			)
		]
	}

	protected def Project generateGrpcClientProject(Project parent, Artifact a) {
		log.debug('Generating gRPC client project for artifact {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(parent.name, 'client')) //
		.basePackage(world.architecture?.basePackage) //
		.dir(namingStrategy.getProjectPath(parent.name+'/client')) //
		.microserviceModel(a)//
		.build => [ p |
			p.templates?.addAll(
				p.generateGrpcClientXtend(a),
				defaultGrpcClientXtend.getTemplate(p)
			)
		]
	}

	protected def Template generateGrpcModelXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC model xtend')

		templateBuilder //
		.project(p) //
		.fileName(a.name.toFirstUpper + 'GrpcModel') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/model') //
		.content('''
			This is the template of GrpcModel.java
		''') //
		.build
	}

	protected def Template generateGrpcDefaultServerXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC default server xtend')

		templateBuilder //
		.project(p) //
		.fileName('Default' + p.name.replaceAll('.', '').toFirstUpper + 'GrpcServer') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcGenPathWithPackage(p) + '/server') //
		.content('''
			This is the template of DefaultGrpcServer.java
		''') //
		.build
	}

	protected def Template generateGrpcServerXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC server xtend')

		templateBuilder //
		.project(p) //
		.fileName(a.name.replaceAll('.', '').toFirstUpper + 'GrpcServer') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/server') //
		.content('''
			This is the template of GrpcServer.java
		''') //
		.build
	}

	protected def Template generateGrpcClientXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC client xtend')

		templateBuilder //
		.project(p) //
		.fileName(a.name.replaceAll('.', '').toFirstUpper + 'GrpcClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/client') //
		.content('''
			This is the template of GrpcClient.java
		''') //
		.build
	}

}

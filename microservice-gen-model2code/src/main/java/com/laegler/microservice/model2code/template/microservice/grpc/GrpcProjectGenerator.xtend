package com.laegler.microservice.model2code.template.microservice.grpc

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.lib.protobuf.ProtobufAdapter
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.SpecificationType
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.Expose
import com.laegler.microservice.model2code.template.microservice.grpc.client.gen.DefaultGrpcClientXtend
import com.laegler.microservice.model2code.template.microservice.grpc.model.res.GrpcProto
import com.squareup.protoparser.ProtoFile
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class GrpcProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(GrpcProjectGenerator)

	@Inject ProtobufAdapter protobufAdapter

	@Inject GrpcPomXml grpcPomXml
	@Inject GrpcProto grpcProto
	@Inject DefaultGrpcClientXtend defaultGrpcClientXtend

	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating gRPC project(s) for {}', a.name)

		Arrays.asList(a.generateGrpcProject(art))
	}

	protected def Project generateGrpcProject(Architecture a, Artifact art) {
		LOG.debug('Generating gRPC project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'grpc')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'grpc')) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects?.addAll(
				generateGrpcParentProject(p, art),
				generateGrpcModelProject(p, art),
				generateGrpcServerProject(p, art),
				generateGrpcClientProject(p, art)
			)
			p.templates?.add(grpcPomXml.getTemplate(p))
		]
	}

	protected def Project generateGrpcParentProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC parent project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'parent')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/parent')) //
		.microserviceModel(a) //
		.build => [p |
//			p.templates?.addAll(
//				grpcModelPomXml.getTemplate(p)
//			)
		]
	}

	protected def Project generateGrpcModelProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC model project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'model')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/model')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				grpcProto.getTemplate(p, a),
				p.generateGrpcModelXtend(a)
			)
		]
	}

	protected def Project generateGrpcServerProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC server project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'server')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/server')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				p.generateGrpcDefaultServerXtend(a),
				p.generateGrpcServerXtend(a)
			)
		]
	}

	protected def Project generateGrpcClientProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC client project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'client')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/client')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				p.generateGrpcClientXtend(a),
				defaultGrpcClientXtend.getTemplate(p)
			)
		]
	}

	protected def Template generateGrpcModelXtend(Project p, Artifact a) {
		LOG.debug('  Generating template: gRPC model xtend')

		Template::builder //
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
		LOG.debug('  Generating template: gRPC default server xtend')

		Template::builder //
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
		LOG.debug('  Generating template: gRPC server xtend')

		Template::builder //
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
		LOG.debug('  Generating template: gRPC client xtend')

		Template::builder //
		.project(p) //
		.fileName(a.name.replaceAll('.', '').toFirstUpper + 'GrpcClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/client') //
		.content('''
			This is the template of GrpcClient.java
		''') //
		.build
	}

	private def ProtoFile getProtobuf(Expose expose) {
		val specType = SpecificationType.values.findFirst[expose.specification.endsWith(it.matcher)]
		if (specType == SpecificationType.PROTOBUF) {
			val specContent = fileHelper.asString(fileHelper.findFile(expose.specification))
			val specModel = protobufAdapter.toModel(specContent)
			return specModel
		}
	}

}

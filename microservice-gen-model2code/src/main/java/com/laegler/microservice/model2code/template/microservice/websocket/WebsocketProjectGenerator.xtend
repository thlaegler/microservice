package com.laegler.microservice.model2code.template.microservice.websocket

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.lib.protobuf.ProtobufAdapter
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.SpecificationType
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.Expose
import com.laegler.microservice.model2code.template.microservice.websocket.WebsocketPomXml
import com.squareup.protoparser.ProtoFile
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.SubProjectType

@Named
class WebsocketProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(WebsocketProjectGenerator)

	@Inject ProtobufAdapter protobufAdapter

	@Inject WebsocketPomXml websocketPomXml
//	@Inject WebsocketProto websocketProto
//	@Inject DefaultWebsocketClientXtend defaultWebsocketClientXtend

	override List<Project> generate(Architecture a) {
		log.debug('Generating gRPC project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateWebsocketProject)
		]
		projects
	}

	protected def Project generateWebsocketProject(Artifact a) {
		log.debug('Generating gRPC project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'websocket')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name + '/websocket')) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects?.addAll(
				generateWebsocketParentProject(p, a),
				generateWebsocketModelProject(p, a),
				generateWebsocketServerProject(p, a),
				generateWebsocketClientProject(p, a)
			)
//			p.templates?.add(websocketPomXml.getTemplate(p))
		]
	}

	protected def Project generateWebsocketParentProject(Project parent, Artifact a) {
		log.debug('Generating gRPC parent project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'parent')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/parent')) //
		.microserviceModel(a) //
		.build => [p |
			p.templates?.addAll(
				websocketPomXml.getTemplate(p, SubProjectType.PARENT)
			)
		]
	}

	protected def Project generateWebsocketModelProject(Project parent, Artifact a) {
		log.debug('Generating gRPC model project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'model')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/model')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				websocketPomXml.getTemplate(p, SubProjectType.MODEL)
//				p.generateWebsocketModelXtend(a)
			)
		]
	}

	protected def Project generateWebsocketServerProject(Project parent, Artifact a) {
		log.debug('Generating gRPC server project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'server')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/server')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				websocketPomXml.getTemplate(p, SubProjectType.SERVER),
				p.generateWebsocketDefaultServerXtend(a),
				p.generateWebsocketServerXtend(a)
			)
		]
	}

	protected def Project generateWebsocketClientProject(Project parent, Artifact a) {
		log.debug('Generating gRPC client project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'client')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/client')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				websocketPomXml.getTemplate(p, SubProjectType.CLIENT),
				p.generateWebsocketClientXtend(a)
//				defaultWebsocketClientXtend.getTemplate(p)
			)
		]
	}

	protected def Template generateWebsocketModelXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC model xtend')

		Template::builder //
		.project(p) //
		.fileName(a.name.toFirstUpper + 'WebsocketModel') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/model') //
		.content('''
			This is the template of WebsocketModel.java
		''') //
		.build
	}

	protected def Template generateWebsocketDefaultServerXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC default server xtend')

		Template::builder //
		.project(p) //
		.fileName('Default' + p.name.replaceAll('.', '').toFirstUpper + 'WebsocketServer') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcGenPathWithPackage(p) + '/server') //
		.content('''
			This is the template of DefaultWebsocketServer.java
		''') //
		.build
	}

	protected def Template generateWebsocketServerXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC server xtend')

		Template::builder //
		.project(p) //
		.fileName(a.name.replaceAll('.', '').toFirstUpper + 'WebsocketServer') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/server') //
		.content('''
			This is the template of WebsocketServer.java
		''') //
		.build
	}

	protected def Template generateWebsocketClientXtend(Project p, Artifact a) {
		log.debug('  Generating template: gRPC client xtend')

		Template::builder //
		.project(p) //
		.fileName(a.name.replaceAll('.', '').toFirstUpper + 'WebsocketClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p) + '/client') //
		.content('''
			This is the template of WebsocketClient.java
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
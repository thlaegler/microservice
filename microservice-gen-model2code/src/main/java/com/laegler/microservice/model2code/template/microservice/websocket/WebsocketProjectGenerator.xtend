package com.laegler.microservice.model2code.template.microservice.websocket

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
<<<<<<< Upstream, based on master
import com.laegler.microservice.adapter.model.SpecificationType
=======
>>>>>>> 63a4349 Cleaned Web Editor
import com.laegler.microservice.adapter.model.SubProjectType
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.JavaUtil
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
<<<<<<< Upstream, based on master
import com.laegler.microservice.model.Expose
import com.squareup.protoparser.ProtoFile
import java.util.Arrays
=======
import com.laegler.microservice.model.Entity
import java.util.ArrayList
>>>>>>> 63a4349 Cleaned Web Editor
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class WebsocketProjectGenerator extends Generator {

<<<<<<< Upstream, based on master
	protected static Logger LOG = LoggerFactory.getLogger(WebsocketProjectGenerator)
=======
	private static Logger log = LoggerFactory.getLogger(WebsocketProjectGenerator)
>>>>>>> 63a4349 Cleaned Web Editor

	@Inject private extension NamingStrategy _name
	@Inject private extension JavaUtil _java

	@Inject WebsocketPomXml websocketPomXml

//	@Inject WebsocketProto websocketProto
//	@Inject DefaultWebsocketClientXtend defaultWebsocketClientXtend
	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating gRPC project(s) for {}', a.name)

		Arrays.asList(a.generateWebsocketProject(art))
	}

	protected def Project generateWebsocketProject(Architecture a, Artifact art) {
		LOG.debug('Generating gRPC project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'websocket')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'websocket')) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects?.addAll(
				generateWebsocketParentProject(p, art),
				generateWebsocketModelProject(p, art),
				generateWebsocketServerProject(p, art),
				generateWebsocketClientProject(p, art)
			)
//			p.templates?.add(websocketPomXml.getTemplate(p))
		]
	}

	protected def Project generateWebsocketParentProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC parent project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'parent')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/parent')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates?.addAll(
				websocketPomXml.getTemplate(p, SubProjectType.PARENT)
			)
		]
	}

	protected def Project generateWebsocketModelProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC model project for artifact {}', a.name)

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
		LOG.debug('Generating gRPC server project for artifact {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(parent.name, 'server')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(namingStrategy.getProjectPath(parent.name + '/server')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates => [
				add(websocketPomXml.getTemplate(p, SubProjectType.SERVER))
				a.entities.forEach[e|
					p.templates.add(p.generateWebsocketDefaultServerJava(a,e))
					p.templates.add(p.generateWebsocketServerJava(a,e))
				]
			]
		]
	}

	protected def Project generateWebsocketClientProject(Project parent, Artifact a) {
		LOG.debug('Generating gRPC client project for artifact {}', a.name)

		Project::builder //
		.name(getProjectName(parent.name, 'client')) //
		.basePackage(world.architecture?.basePackage) //
		.directory(getProjectPath(parent.name + '/client')) //
		.microserviceModel(a) //
		.build => [ p |
			p.templates => [
				add(websocketPomXml.getTemplate(p, SubProjectType.CLIENT))
				a.entities.forEach[e|
					p.templates.add(p.generateWebsocketClientJava(a,e))
//					p.templates.add(p.defaultWebsocketClientXtend.getTemplate(p)
				]
			]
		]
	}

<<<<<<< Upstream, based on master
	protected def Template generateWebsocketModelXtend(Project p, Artifact a) {
		LOG.debug('  Generating template: gRPC model xtend')
=======
	protected def Template generateWebsocketModelJava(Project p, Artifact a) {
		log.debug('  Generating template: websocket model java')
>>>>>>> 63a4349 Cleaned Web Editor

		Template::builder //
		.project(p) //
		.fileName(a.name.toFirstUpper + 'WebsocketModel') //
		.fileType(FileType.XTEND) //
		.relativPath(p.srcPathWithPackage + '/model') //
		.content('''
			package «p.basePackage»;
															
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			«p.javaDocType»
			@RestController
			public class Default«a.name.camelUp»WebsocketServer {
			
				private static final Logger LOG = LoggerFactory.getLogger(«a.name.camelUp»WebsocketServer.class);
			
			}
		''') //
		.build
	}

<<<<<<< Upstream, based on master
	protected def Template generateWebsocketDefaultServerXtend(Project p, Artifact a) {
		LOG.debug('  Generating template: gRPC default server xtend')
=======
	protected def Template generateWebsocketDefaultServerJava(Project p, Artifact a, Entity e) {
		log.debug('  Generating template: websocket default server java')
>>>>>>> 63a4349 Cleaned Web Editor

		Template::builder //
		.project(p) //
		.fileName('Default' + e.name.camelUp + 'WebsocketController') //
		.fileType(FileType.JAVA) //
		.relativPath(p.srcGenPathWithPackage + '/server') //
		.content('''
			package «p.basePackage»;
												
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			«p.javaDocType»
			@RestController
			public class Default«e.name.camelUp»WebsocketController {
			
				private static final Logger LOG = LoggerFactory.getLogger(Default«e.name.camelUp»WebsocketController.class);
			
			}
		''') //
		.build
	}

<<<<<<< Upstream, based on master
	protected def Template generateWebsocketServerXtend(Project p, Artifact a) {
		LOG.debug('  Generating template: gRPC server xtend')
=======
	protected def Template generateWebsocketServerJava(Project p, Artifact a, Entity e) {
		log.debug('  Generating template: websocket server java')
>>>>>>> 63a4349 Cleaned Web Editor

		Template::builder //
		.project(p) //
		.fileName(e.name.camelUp + 'WebsocketController') //
		.fileType(FileType.JAVA) //
		.relativPath(p.srcPathWithPackage + '/server') //
		.content('''
			package «p.basePackage»;
									
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			import org.springframework.beans.factory.annotation.Autowired;
			import org.springframework.messaging.handler.annotation.DestinationVariable;
			import org.springframework.messaging.handler.annotation.MessageMapping;
			import org.springframework.messaging.handler.annotation.SendTo;
			import org.springframework.stereotype.Controller;
			«p.javaDocType»
			@Controller
			public class «e.name.camelUp»WebsocketController {
			
				private static final Logger LOG = LoggerFactory.getLogger(«e.name.camelUp»WebsocketController.class);
			
			}
		''') //
		.build
	}

<<<<<<< Upstream, based on master
	protected def Template generateWebsocketClientXtend(Project p, Artifact a) {
		LOG.debug('  Generating template: gRPC client xtend')
=======
	protected def Template generateWebsocketClientJava(Project p, Artifact a, Entity e) {
		log.debug('  Generating template: websocket client java')
>>>>>>> 63a4349 Cleaned Web Editor

		Template::builder //
		.project(p) //
		.fileName(e.name.camelUp + 'WebsocketClient') //
		.fileType(FileType.JAVA) //
		.relativPath(p.srcPathWithPackage + '/client') //
		.content('''
			package «p.basePackage»;
									
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			«p.javaDocType»
			@Component
			public class «e.name.camelUp»WebsocketClient {
			
				private static final Logger LOG = LoggerFactory.getLogger(«e.name.camelUp»WebsocketClient.class);
			
			}
		''') //
		.build
	}
	
	protected def Template generateWebsocketClientConfigJava(Project p, Artifact a) {
		log.debug('  Generating template: websocket client config java')

		Template::builder //
		.project(p) //
		.fileName(a.name.camelUp + 'WebsocketClientConfig') //
		.fileType(FileType.JAVA) //
		.relativPath(p.srcPathWithPackage + '/client') //
		.content('''
			package «p.basePackage»;
									
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			«p.javaDocType»
			@Configuration
			class «a.name.camelUp»WebsocketClientConfig extends AbstractUsersWebsocketClientConfig {
				
				private static final Logger LOG = LoggerFactory.getLogger(«a.name.camelUp»WebsocketClient.class);
			
			}
		''') //
		.build
	}
	
}

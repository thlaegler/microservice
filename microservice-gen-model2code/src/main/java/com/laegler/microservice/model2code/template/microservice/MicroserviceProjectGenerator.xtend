package com.laegler.microservice.model2code.template.microservice

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model2code.template.microservice.app.AppProjectGenerator
import com.laegler.microservice.model2code.template.microservice.business.BusinessProjectGenerator
import com.laegler.microservice.model2code.template.microservice.grpc.GrpcProjectGenerator
import com.laegler.microservice.model2code.template.microservice.model.ModelProjectGenerator
import com.laegler.microservice.model2code.template.microservice.rest.RestProjectGenerator
import com.laegler.microservice.model2code.template.microservice.soap.SoapProjectGenerator
import com.laegler.microservice.model2code.template.microservice.websocket.WebsocketProjectGenerator
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.util.ArrayList
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.adapter.util.NamingStrategy

@Named
class MicroserviceProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(MicroserviceProjectGenerator)

	@Inject private extension NamingStrategy _name

	@Inject ModelProjectGenerator modelProject
	@Inject BusinessProjectGenerator businessProject
	@Inject SoapProjectGenerator soapProject
	@Inject RestProjectGenerator restProject
	@Inject GrpcProjectGenerator grpcProject
	@Inject WebsocketProjectGenerator websocketProject
	@Inject AppProjectGenerator appProject

	@Inject AggregatorPomXml aggregatorPomXml

	def List<Project> generate(Architecture a) {
		LOG.debug('Generating Base project for architecture {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(a.generateBaseProject(art))
		]
		projects
	}

	protected def Project generateBaseProject(Architecture a, Artifact art) {
		Project::builder //
//		.name(namingStrategy.getProjectName(a.name, art.name)) //
		.name(a.name.getProjectName('model')) //
		.basePackage(a.basePackage) //
//		.directory(namingStrategy.getProjectPath(a.name, art.name)) //
		.directory(a.name.getProjectPath('model')) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects => [
				addAll(modelProject.generate(a, art))
				addAll(businessProject.generate(a, art))
				addAll(soapProject.generate(a, art))
				addAll(restProject.generate(a, art))
				addAll(grpcProject.generate(a, art))
				addAll(websocketProject.generate(a, art))
				addAll(appProject.generate(a, art))
			]
			p.templates => [
				add(aggregatorPomXml.getTemplate(p))
			]
		]
	}

}

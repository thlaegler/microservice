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

@Named
class MicroserviceProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(MicroserviceProjectGenerator)

	@Inject ModelProjectGenerator modelProject
	@Inject BusinessProjectGenerator businessProject
	@Inject SoapProjectGenerator soapProject
	@Inject RestProjectGenerator restProject
	@Inject GrpcProjectGenerator grpcProject
	@Inject WebsocketProjectGenerator websocketProject
	@Inject AppProjectGenerator appProject

	@Inject AggregatorPomXml aggregatorPomXml

	override List<Project> generate(Architecture a) {
		log.debug('Generating Base project for architecture {}', a.name)

		Arrays.asList(
			a.generateBaseProject
		)
	}

	protected def Project generateBaseProject(Architecture a) {
		Project::builder //
		.name(namingStrategy.getProjectName(a.name)) //
		.basePackage(a.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name)) //
//		.directory('example') //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects => [
				addAll(modelProject.generate(a))
				addAll(businessProject.generate(a))
				addAll(soapProject.generate(a))
				addAll(restProject.generate(a))
				addAll(grpcProject.generate(a))
				addAll(websocketProject.generate(a))
				addAll(appProject.generate(a))
			]
			p.templates => [
				add(aggregatorPomXml.getTemplate(p))
			]
		]
	}

}

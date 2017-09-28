package com.laegler.microservice.model2code.template.env

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model2code.template.env.oauth2.OAuth2ProjectGenerator
import com.laegler.microservice.model2code.template.env.gateway.GatewayProjectGenerator
import com.laegler.microservice.model2code.template.env.redis.RedisProjectGenerator

@Named
class EnvProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(EnvProjectGenerator)

	@Inject private extension NamingStrategy _name

//	@Inject CloudConfigProjectGenerator configProject
	@Inject GatewayProjectGenerator gatewayProject
	@Inject OAuth2ProjectGenerator oauth2Project
	@Inject RedisProjectGenerator redisProject
//	@Inject ElasticsearchProjectGenerator elasticsearchProject
//	@Inject MySqlProjectGenerator mysqlProject
//	@Inject CouchbaseProjectGenerator couchbaseProject
//	@Inject MongoDbProjectGenerator mongoDbProject

	@Inject EnvAggregatorPomXml aggregatorPomXml

	override List<Project> generate(Architecture a) {
		log.debug('Generating Base project for architecture {}', a.name)

		Arrays.asList(
			a.generateEnvProject
		)
	}

	protected def Project generateEnvProject(Architecture a) {
		Project::builder //
		.name(a.name.getProjectName('env')) //
		.basePackage(a.basePackage) //
		.directory(a.name.getProjectPath('env')) //
		.microserviceModel(a) //
		.build => [ p |
			p.subProjects => [ sub |
				sub.addAll(gatewayProject.generate(a))
				sub.addAll(oauth2Project.generate(a))
				sub.addAll(redisProject.generate(a))
//				sub.addAll(configProject.generate(a))
			]
			p.templates => [
				add(aggregatorPomXml.getTemplate(p))
			]
		]
	}

}

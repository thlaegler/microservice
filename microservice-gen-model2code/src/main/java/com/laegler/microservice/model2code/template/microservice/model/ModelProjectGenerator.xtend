package com.laegler.microservice.model2code.template.microservice.model

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.microservice.model.ModelPomXml
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.util.Arrays
import com.laegler.microservice.adapter.util.NamingStrategy

@Named
class ModelProjectGenerator extends Generator {

	protected static final Logger LOG = LoggerFactory.getLogger(ModelProjectGenerator)

	@Inject private extension NamingStrategy _name

	@Inject ModelPomXml modelPomXml
	@Inject EntityJava entityJava
	@Inject JpaRepoJava jpaRepoJava
	@Inject CouchbaseRepoJava couchRepoJava
	@Inject RedisRepoJava redisRepoJava
	@Inject EsRepoJava esRepoJava

	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating Model project(s) for architecture {}', a.name)

		Arrays.asList(a.generateModelProject(art))
	}

	protected def Project generateModelProject(Architecture a, Artifact art) {
		LOG.debug('Generating Model project for artifact {}', a.name)

		Project::builder //
//		.name(namingStrategy.getProjectName(a.name, art.name, 'model')) //
		.name(a.name.getProjectName('model')) //
		.basePackage(world.architecture?.basePackage) //
//		.directory(namingStrategy.getProjectPath(a.name, art.name, 'model')) //
		.directory(a.name.getProjectPath('model')) //
		.microserviceModel(art) //
		.build => [ p |
			p.templates.add(modelPomXml.getTemplate(p))
			a.entities?.forEach [ e |
				p.templates.add(entityJava.getTemplate(p, e))
				p.templates.add(jpaRepoJava.getTemplate(p, e))
				p.templates.add(redisRepoJava.getTemplate(p, e))
				p.templates.add(esRepoJava.getTemplate(p, e))
				p.templates.add(couchRepoJava.getTemplate(p, e))
			]
		]
	}

}

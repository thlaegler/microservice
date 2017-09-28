package com.laegler.microservice.model2code.template.env.redis

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.env.redis.RedisPomXml
import com.laegler.microservice.model2code.template.env.redis.RedisEclipseDotClasspath
import com.laegler.microservice.model2code.template.env.redis.RedisEclipseDotProject
import com.laegler.microservice.model2code.template.env.redis.RedisIntellijProjectIml
import com.laegler.microservice.model2code.template.env.redis.RedisReadmeMd
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class RedisProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(RedisProjectGenerator)

	@Inject RedisPomXml redisPomXml
	@Inject RedisEclipseDotProject eclipseDotProject
	@Inject RedisEclipseDotClasspath eclipseDotClasspath
	@Inject RedisIntellijProjectIml intellijProjectIml
	@Inject RedisReadmeMd readmeMd

//	@Inject RedisAppXtend appXtend
//	@Inject RedisAppConfigXtend appConfigXtend
//
//	@Inject RedisAppYaml appYaml
//	@Inject RedisBootstrapYaml bootstrapYaml
//	@Inject RedisDockerfile dockerfile
//	@Inject RedisKubernetesDeploymentYaml kubernetesDeploymentYaml

	override List<Project> generate(Architecture a) {
		log.debug('Generating auth project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(
				Project::builder //
				.name(namingStrategy.getProjectName('redis')) //
				.basePackage(world.architecture?.basePackage) //
//				.directory(namingStrategy.getProjectPath('redis')) //
				.directory('redis') //
				.build => [ p |
					p.templates?.add(redisPomXml.getTemplate(p))
					p.templates?.add(eclipseDotProject.getTemplate(p))
					p.templates?.add(eclipseDotClasspath.getTemplate(p))
					p.templates?.add(intellijProjectIml.getTemplate(p))
					p.templates?.add(readmeMd.getTemplate(p))

//					p.templates?.add(appXtend.getTemplate(p))
//					p.templates?.add(appConfigXtend.getTemplate(p))
//
//					p.templates?.add(appYaml.getTemplate(p))
//					p.templates?.add(bootstrapYaml.getTemplate(p))
//					p.templates?.add(dockerfile.getTemplate(p))
//					p.templates?.add(kubernetesDeploymentYaml.getTemplate(p))
				]
			)
		]
		projects
	}

}

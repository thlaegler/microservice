package com.laegler.microservice.model2code.template.env.gateway

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model2code.template.env.gateway.res.GatewayAppYaml
import com.laegler.microservice.model2code.template.env.gateway.res.GatewayBootstrapYaml
import com.laegler.microservice.model2code.template.env.gateway.res.GatewayDockerfile
import com.laegler.microservice.model2code.template.env.gateway.res.GatewayKubernetesDeploymentYaml
import com.laegler.microservice.model2code.template.env.gateway.src.GatewayAppConfigXtend
import com.laegler.microservice.model2code.template.env.gateway.src.GatewayAppXtend
import java.util.Arrays
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class GatewayProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(GatewayProjectGenerator)

	@Inject GatewayPomXml gatewayPomXml
	@Inject GatewayEclipseDotProject eclipseDotProject
	@Inject GatewayEclipseDotClasspath eclipseDotClasspath
	@Inject GatewayIntellijProjectIml intellijProjectIml
	@Inject GatewayReadmeMd readmeMd

	@Inject GatewayAppXtend appXtend
	@Inject GatewayAppConfigXtend appConfigXtend

	@Inject GatewayAppYaml appYaml
	@Inject GatewayBootstrapYaml bootstrapYaml
	@Inject GatewayDockerfile dockerfile
	@Inject GatewayKubernetesDeploymentYaml kubernetesDeploymentYaml

	def List<Project> generate(Architecture a) {
		LOG.debug('Generating auth project(s) for {}', a.name)

		Arrays.asList(
			Project::builder //
			.name(namingStrategy.getProjectName(a.name, 'gateway')) //
			.basePackage(world.architecture?.basePackage) //
			.directory(namingStrategy.getProjectPath(a.name, 'gateway')) //
			.build => [ p |
				p.templates?.add(gatewayPomXml.getTemplate(p))
				p.templates?.add(eclipseDotProject.getTemplate(p))
				p.templates?.add(eclipseDotClasspath.getTemplate(p))
				p.templates?.add(intellijProjectIml.getTemplate(p))
				p.templates?.add(readmeMd.getTemplate(p))

				p.templates?.add(appXtend.getTemplate(p))
				p.templates?.add(appConfigXtend.getTemplate(p))

				p.templates?.add(appYaml.getTemplate(p))
				p.templates?.add(bootstrapYaml.getTemplate(p))
				p.templates?.add(dockerfile.getTemplate(p))
				p.templates?.add(kubernetesDeploymentYaml.getTemplate(p))
			]
		)
	}

}

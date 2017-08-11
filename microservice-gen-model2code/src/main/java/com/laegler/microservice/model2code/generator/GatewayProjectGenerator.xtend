package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.gateway.GatewayPomXml
import com.laegler.microservice.model2code.template.gateway.GatewayEclipseDotClasspath
import com.laegler.microservice.model2code.template.gateway.GatewayEclipseDotProject
import com.laegler.microservice.model2code.template.gateway.GatewayIntellijProjectIml
import com.laegler.microservice.model2code.template.gateway.GatewayReadmeMd
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model2code.template.gateway.res.GatewayKubernetesDeploymentYaml
import com.laegler.microservice.model2code.template.gateway.res.GatewayBootstrapYaml
import com.laegler.microservice.model2code.template.gateway.res.GatewayAppYaml
import com.laegler.microservice.model2code.template.gateway.src.GatewayAppXtend
import com.laegler.microservice.model2code.template.gateway.src.GatewayAppConfigXtend
import com.laegler.microservice.model2code.template.gateway.res.GatewayDockerfile

@Named
class GatewayProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(AuthProjectGenerator)

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

	override List<Project> generate(Architecture a) {
		log.debug('Generating auth project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(
				Project::builder //
				.name(namingStrategy.getProjectName('gateway')) //
				.basePackage(world.architecture?.basePackage) //
//				.directory(namingStrategy.getProjectPath('gateway')) //
				.directory('gateway') //
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
		]
		projects
	}

}

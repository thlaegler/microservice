package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.auth.AuthPomXml
import com.laegler.microservice.model2code.template.auth.AuthEclipseDotClasspath
import com.laegler.microservice.model2code.template.auth.AuthEclipseDotProject
import com.laegler.microservice.model2code.template.auth.AuthIntellijProjectIml
import com.laegler.microservice.model2code.template.auth.AuthReadmeMd
import com.laegler.microservice.model2code.template.auth.src.AuthAppXtend
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model2code.template.auth.src.AuthAppConfigXtend
import com.laegler.microservice.model2code.template.auth.res.AuthAppYaml
import com.laegler.microservice.model2code.template.auth.res.AuthBootstrapYaml
import com.laegler.microservice.model2code.template.auth.res.AuthKubernetesDeploymentYaml
import com.laegler.microservice.model2code.template.auth.res.AuthDockerfile

@Named
class AuthProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(AuthProjectGenerator)

	@Inject AuthPomXml authPomXml
	@Inject AuthEclipseDotProject eclipseDotProject
	@Inject AuthEclipseDotClasspath eclipseDotClasspath
	@Inject AuthIntellijProjectIml intellijProjectIml
	@Inject AuthReadmeMd readmeMd

	@Inject AuthAppXtend appXtend
	@Inject AuthAppConfigXtend appConfigXtend

	@Inject AuthAppYaml appYaml
	@Inject AuthBootstrapYaml bootstrapYaml
	@Inject AuthDockerfile dockerfile
	@Inject AuthKubernetesDeploymentYaml kubernetesDeploymentYaml

	override List<Project> generate(Architecture a) {
		log.debug('Generating auth project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(
				Project::builder //
				.name(namingStrategy.getProjectName('auth')) //
				.basePackage(world.architecture?.basePackage) //
//				.directory(namingStrategy.getProjectPath('auth')) //
				.directory('auth') //
				.build => [ p |
					p.templates?.add(authPomXml.getTemplate(p))
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

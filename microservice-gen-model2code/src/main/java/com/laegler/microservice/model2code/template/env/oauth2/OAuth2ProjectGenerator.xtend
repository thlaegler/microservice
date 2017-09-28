package com.laegler.microservice.model2code.template.env.oauth2

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.template.env.oauth2.res.OAuth2AppYaml
import com.laegler.microservice.model2code.template.env.oauth2.res.OAuth2BootstrapYaml
import com.laegler.microservice.model2code.template.env.oauth2.res.OAuth2Dockerfile
import com.laegler.microservice.model2code.template.env.oauth2.res.OAuth2K8sYaml
import com.laegler.microservice.model2code.template.env.oauth2.src.OAuth2AppConfigJava
import com.laegler.microservice.model2code.template.env.oauth2.src.OAuth2AppJava
import java.util.ArrayList
import java.util.List
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class OAuth2ProjectGenerator extends Generator {

	protected static Logger log = LoggerFactory.getLogger(OAuth2ProjectGenerator)

	@Inject AuthPomXml authPomXml
	@Inject AuthEclipseDotProject eclipseDotProject
	@Inject AuthEclipseDotClasspath eclipseDotClasspath
	@Inject AuthIntellijProjectIml intellijProjectIml
	@Inject AuthReadmeMd readmeMd

	@Inject OAuth2AppJava appXtend
	@Inject OAuth2AppConfigJava appConfigXtend

	@Inject OAuth2AppYaml appYaml
	@Inject OAuth2BootstrapYaml bootstrapYaml
	@Inject OAuth2Dockerfile dockerfile
	@Inject OAuth2K8sYaml kubernetesDeploymentYaml

	override List<Project> generate(Architecture a) {
		log.debug('Generating auth project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(
				Project::builder //
				.name(namingStrategy.getProjectName('oauth2')) //
				.basePackage(world.architecture?.basePackage) //
//				.directory(namingStrategy.getProjectPath('oauth2')) //
				.directory('oauth2') //
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

package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.annotations.ProcessingStep
import com.itemis.maven.plugins.cdi.CDIMojoProcessingStep
import javax.inject.Inject
import javax.inject.Named
import com.itemis.maven.plugins.cdi.ExecutionContext
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import com.laegler.microservice.codegen.Code2ModelTransformator
import org.apache.maven.project.MavenProject

@ProcessingStep(id='code2model', description='Generate model from code.', requiresOnline=false)
class Code2ModelMojoStep extends AbstractMojoStep implements CDIMojoProcessingStep {

	@Inject Code2ModelTransformator transformator

	@Inject @Named('project') MavenProject project
	@Inject @Named('name') String name
	@Inject @Named('basePackage') String basePackage
	@Inject @Named('activateCode2Model') boolean activateCode2Model

	override void execute(ExecutionContext context) throws MojoExecutionException, MojoFailureException {
		if (activateCode2Model) {
			LOG.info('Code Generation is not activated: set <activateCode2Model>true<activateCode2Model>.')
			return
		}

		transformator.generate(project, name, basePackage)
	}

}

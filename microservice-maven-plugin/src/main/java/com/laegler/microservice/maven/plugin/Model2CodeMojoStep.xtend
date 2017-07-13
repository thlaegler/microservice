package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.CDIMojoProcessingStep
import com.itemis.maven.plugins.cdi.ExecutionContext
import com.itemis.maven.plugins.cdi.annotations.ProcessingStep
import com.laegler.microservice.model2code.Model2CodeTransformator
import javax.inject.Inject
import javax.inject.Named
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.project.MavenProject

@ProcessingStep(id='model2code', description='Generate code from model.', requiresOnline=false)
class Model2CodeMojoStep extends AbstractMojoStep implements CDIMojoProcessingStep {

	@Inject Model2CodeTransformator transformator
	
	@Inject @Named('project') MavenProject project
	@Inject @Named('name') String name
	@Inject @Named('basePackage') String basePackage
	@Inject @Named('activateModel2Code') boolean activateModel2Code

	override void execute(ExecutionContext context) throws MojoExecutionException, MojoFailureException {
		if (activateModel2Code) {
			LOG.info('Code Generation is not activated: set <activateModel2Code>true<activateModel2Code>.')
			return
		}

		transformator.generate(project, name, basePackage)
	}

}

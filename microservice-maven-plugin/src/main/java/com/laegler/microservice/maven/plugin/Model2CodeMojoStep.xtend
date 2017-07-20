package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.CDIMojoProcessingStep
import com.itemis.maven.plugins.cdi.ExecutionContext
import com.itemis.maven.plugins.cdi.annotations.ProcessingStep
import com.laegler.microservice.model2code.Model2CodeTransformator
import javax.inject.Inject
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.slf4j.Logger

@ProcessingStep(id='model2code', description='Generate code from model.', requiresOnline=false)
class Model2CodeMojoStep extends AbstractMojoStep implements CDIMojoProcessingStep {

	@Inject
	Logger LOG

	@Inject
	Model2CodeTransformator transformator

	override void execute(ExecutionContext context) throws MojoExecutionException, MojoFailureException {
		LOG.debug('Starting model2code mojo step of microservice maven plugin ...')

		init()

		if (!activateModel2Code) {
			LOG.debug('Code Generation is not activated: set <activateModel2Code>true<activateModel2Code>.')
			return
		}

		transformator.generate(project, name, basePackage)
	}

}

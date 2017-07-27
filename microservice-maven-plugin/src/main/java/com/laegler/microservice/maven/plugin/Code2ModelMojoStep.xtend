package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.CDIMojoProcessingStep
import com.itemis.maven.plugins.cdi.ExecutionContext
import com.itemis.maven.plugins.cdi.annotations.ProcessingStep
import com.laegler.microservice.code2model.Code2ModelTransformator
import javax.inject.Inject
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.slf4j.Logger

@ProcessingStep(id='code2model', description='Generate model from code.', requiresOnline=false)
class Code2ModelMojoStep extends AbstractMojoStep implements CDIMojoProcessingStep {

	@Inject
	Logger LOG

	@Inject
	Code2ModelTransformator transformator

	override void execute(ExecutionContext context) throws MojoExecutionException, MojoFailureException {
		LOG.debug('Starting code2model mojo step of microservice maven plugin ...')

		init()

		if (!activateCode2Model) {
			LOG.debug('Model Generation is not activated: set <activateCode2Model>true<activateCode2Model>.')
			return
		}

		transformator.generate(project, name, basePackage)
	}

}

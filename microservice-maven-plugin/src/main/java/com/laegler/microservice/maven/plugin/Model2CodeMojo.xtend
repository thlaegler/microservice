package com.laegler.microservice.maven.plugin

import com.laegler.microservice.codegen.Code2ModelTransformator
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.plugins.annotations.LifecyclePhase
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.ResolutionScope
import org.eclipse.xtend.lib.annotations.Data

@Mojo(name="model2code", defaultPhase=LifecyclePhase.
	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
@Data
class Model2CodeMojo extends AbstractCodegenMojo {

	extension Code2ModelTransformator transformator = new Code2ModelTransformator

	override void execute() throws MojoExecutionException, MojoFailureException {
		if (activateCodeGen) {
			log.info('Code Generation is not activated: set <activateCodeGen>true<activateCodeGen>.')
			return
		}

		project.generate(name, basePackage)
	}

	new() {
		super()
	}

}

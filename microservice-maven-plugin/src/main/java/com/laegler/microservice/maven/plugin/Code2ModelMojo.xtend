package com.laegler.microservice.maven.plugin

import com.laegler.microservice.codegen.Code2ModelTransformator
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.plugins.annotations.LifecyclePhase
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.ResolutionScope
import org.eclipse.xtend.lib.annotations.Data

@Mojo(name="code2model", defaultPhase=LifecyclePhase.
	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
@Data
class Code2ModelMojo extends AbstractCodegenMojo {

	extension Code2ModelTransformator transformator = new Code2ModelTransformator

	new() {
		super()
	}

	override void execute() throws MojoExecutionException, MojoFailureException {
		if (activateCodeGen) {
			log.info('Code Generation is not activated: set <activateCodeGen>true<activateCodeGen>.')
			return
		}

		project.generate(name, basePackage)
	}

}

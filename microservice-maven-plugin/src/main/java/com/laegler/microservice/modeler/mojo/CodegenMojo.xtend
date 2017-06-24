package com.laegler.microservice.modeler.mojo

import com.laegler.microservice.codegen.MavenProjectToArchitecture
import java.io.File
import org.apache.maven.plugin.AbstractMojo
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.plugins.annotations.LifecyclePhase
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.Parameter
import org.apache.maven.plugins.annotations.ResolutionScope
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Data

@Mojo(name="codegen", defaultPhase=LifecyclePhase.
	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
@Data
class CodegenMojo extends AbstractMojo {

	@Parameter(defaultValue="${project}", readonly=true)
	val MavenProject project

	@Parameter(property="activateCodeGen", defaultValue="false", required=false, readonly=true)
	val boolean activateCodeGen = false;

	@Parameter(property="targetDirectory", defaultValue="${project.build.outputDirectory}/generated", required=false, readonly=true)
	val File targetDirectory

	extension MavenProjectToArchitecture mavenProject2Architecture = new MavenProjectToArchitecture

	override void execute() throws MojoExecutionException, MojoFailureException {
		if (activateCodeGen) {
			log.info('Code Generation is not activated: set <activateCodeGen>true<activateCodeGen>.')
			return
		}

		project.transform
	}

}

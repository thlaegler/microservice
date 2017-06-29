package com.laegler.microservice.maven.plugin

import java.io.File
import org.apache.maven.plugin.AbstractMojo
import org.apache.maven.plugins.annotations.Parameter
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

abstract class AbstractCodegenMojo extends AbstractMojo {

	@Accessors(PUBLIC_GETTER)
	@Parameter(defaultValue="${project}", readonly=true)
	protected MavenProject project

	@Accessors(PUBLIC_GETTER)
	@Parameter(property="basePackage", required=false, readonly=true)
	protected String basePackage;

	@Accessors(PUBLIC_GETTER)
	@Parameter(property="name", required=false, readonly=true)
	protected String name;

	@Accessors(PUBLIC_GETTER)
	@Parameter(property="activateCodeGen", defaultValue="false", required=false, readonly=true)
	protected boolean activateCodeGen = false;

	@Accessors(PUBLIC_GETTER)
	@Parameter(property="targetDirectory", defaultValue="${project.build.outputDirectory}/generated", required=false, readonly=true)
	protected File targetDirectory

	new() {
		super()
	}
}

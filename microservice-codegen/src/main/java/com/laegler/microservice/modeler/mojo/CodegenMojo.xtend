//package com.laegler.microservice.modeler.mojo
//
//import java.io.File
//import java.util.List
//import org.apache.maven.plugins.annotations.Parameter
//import org.apache.maven.plugins.annotations.Mojo
//import org.apache.maven.plugins.annotations.LifecyclePhase
//import org.apache.maven.plugin.AbstractMojo
//import org.apache.maven.plugin.MojoExecutionException
//import org.apache.maven.plugins.annotations.ResolutionScope
//import org.apache.maven.plugin.MojoFailureException
//import org.apache.maven.project.MavenProject
//
//@Mojo(name="codegen", defaultPhase=LifecyclePhase.
//	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
//class CodegenMojo extends AbstractMojo {
//
//	@Parameter(defaultValue="${project}", readonly=true)
//	var MavenProject project
//
//	@Parameter(property="skipCodeGen", defaultValue="false", required=false, readonly=true)
//	var boolean skipCodeGen
//
//	@Parameter(property="targetDirectory", defaultValue="${project.build.outputDirectory}/generated", required=false, readonly=true)
//	var File targetDirectory
//
//	var String projectEncoding
//
//	override void execute() throws MojoExecutionException, MojoFailureException {
//		if (project != null) {
//			projectEncoding = project.getProperties().getProperty("project.build.sourceEncoding");
//		}
//
//		if (skipCodeGen) {
//			getLog().info("Code Generation is skipped.");
//			return;
//		}
//
//	}
//}

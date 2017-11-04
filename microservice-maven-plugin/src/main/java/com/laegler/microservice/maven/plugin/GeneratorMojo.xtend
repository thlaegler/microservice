package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.AbstractCDIMojo
import com.itemis.maven.plugins.cdi.annotations.MojoProduces
import java.io.File
import javax.inject.Named
import org.apache.maven.plugin.descriptor.PluginDescriptor
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.Parameter
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Mojo(name="generator")
//, defaultPhase=LifecyclePhase.
//	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
class GeneratorMojo extends AbstractCDIMojo {

	@MojoProduces
	@Named("project")
	@Parameter(defaultValue='${project}', readonly = true, required = true)
	MavenProject project

	@MojoProduces
	@Named("basePackage")
	@Parameter(defaultValue='${project.groupId}', required=false)
	String basePackage;

	@MojoProduces
	@Named("name")
	@Parameter(defaultValue='${project.artifactId}', required=false)
	String name;

	@MojoProduces
	@Named("activateCode2Model")
	@Parameter(defaultValue='false', required=false)
	boolean activateCode2Model = false;

	@MojoProduces
	@Named("activateModel2Code")
	@Parameter(defaultValue='false', required=false)
	boolean activateModel2Code = false;

	@MojoProduces
	@Named("targetDirectory")
	@Parameter(defaultValue='${project.build.outputDirectory}/generated', required=false, readonly=true)
	File targetDirectory

	@MojoProduces
	def PluginDescriptor getPluginDescriptor() {
		return getPluginContext().get('pluginDescriptor') as PluginDescriptor;
	}

//	@MojoProduces
//	def Logger getLogger() {
//		StaticLoggerBinder.getSingleton().setMavenLog(this.log)
//		this.LOG.debug('Init slf4j Logger')
//		val logger = LoggerFactory.getLogger('com.laegler.microservice')
//		logger
//	}
}

package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.AbstractCDIMojo
import com.itemis.maven.plugins.cdi.annotations.MojoProduces
import java.io.File
import javax.inject.Named
import org.apache.maven.plugin.descriptor.PluginDescriptor
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.Parameter
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.AccessorType
import org.eclipse.xtend.lib.annotations.Accessors

import static extension org.eclipse.xtend.lib.annotations.AccessorType.*

@Mojo(name="generator")
//, defaultPhase=LifecyclePhase.
//	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
class GeneratorMojo extends AbstractCDIMojo {

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("project")
	@Parameter(defaultValue='${project}', readonly=true)
	protected MavenProject project

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("basePackage")
	@Parameter(property='basePackage', required=false, readonly=true)
	protected String basePackage;

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("name")
	@Parameter(property='name', required=false, readonly=true)
	protected String name;

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("activateCode2Model")
	@Parameter(property='activateCode2Model', defaultValue='false', required=false, readonly=true)
	protected boolean activateCode2Model = false;

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("activateModel2Code")
	@Parameter(property='activateModel2Code', defaultValue='false', required=false, readonly=true)
	protected boolean activateModel2Code = false;

	@Accessors(AccessorType.PUBLIC_GETTER)
	@MojoProduces
	@Named("targetDirectory")
	@Parameter(property='targetDirectory', defaultValue='${project.build.outputDirectory}/generated', required=false, readonly=true)
	protected File targetDirectory

	@MojoProduces
	def PluginDescriptor getPluginDescriptor() {
		return getPluginContext().get('pluginDescriptor') as PluginDescriptor;
	}
}

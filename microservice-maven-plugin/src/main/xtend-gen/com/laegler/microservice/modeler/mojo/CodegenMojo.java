package com.laegler.microservice.modeler.mojo;

import com.laegler.microservice.codegen.Code2ModelTransformator;
import java.io.File;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.plugins.annotations.LifecyclePhase;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.plugins.annotations.Parameter;
import org.apache.maven.plugins.annotations.ResolutionScope;
import org.apache.maven.project.MavenProject;
import org.eclipse.xtend.lib.annotations.Data;
import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder;

@Mojo(name = "codegen", defaultPhase = LifecyclePhase.GENERATE_SOURCES, threadSafe = true, requiresDependencyResolution = ResolutionScope.COMPILE)
@Data
@SuppressWarnings("all")
public class CodegenMojo extends AbstractMojo {
  @Parameter(defaultValue = "${project}", readonly = true)
  private final MavenProject project;
  
  @Parameter(property = "activateCodeGen", defaultValue = "false", required = false, readonly = true)
  private final boolean activateCodeGen = false;
  
  @Parameter(property = "targetDirectory", defaultValue = "${project.build.outputDirectory}/generated", required = false, readonly = true)
  private final File targetDirectory;
  
  private final Code2ModelTransformator transformator = new Code2ModelTransformator();
  
  public void execute() throws MojoExecutionException, MojoFailureException {
    if (this.activateCodeGen) {
      this.getLog().info("Code Generation is not activated: set <activateCodeGen>true<activateCodeGen>.");
      return;
    }
    this.transformator.transform(this.project);
  }
  
  public CodegenMojo(final MavenProject project, final File targetDirectory) {
    super();
    this.project = project;
    this.targetDirectory = targetDirectory;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.project== null) ? 0 : this.project.hashCode());
    result = prime * result + (this.activateCodeGen ? 1231 : 1237);
    result = prime * result + ((this.targetDirectory== null) ? 0 : this.targetDirectory.hashCode());
    result = prime * result + ((this.transformator== null) ? 0 : this.transformator.hashCode());
    return result;
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    CodegenMojo other = (CodegenMojo) obj;
    if (this.project == null) {
      if (other.project != null)
        return false;
    } else if (!this.project.equals(other.project))
      return false;
    if (other.activateCodeGen != this.activateCodeGen)
      return false;
    if (this.targetDirectory == null) {
      if (other.targetDirectory != null)
        return false;
    } else if (!this.targetDirectory.equals(other.targetDirectory))
      return false;
    if (this.transformator == null) {
      if (other.transformator != null)
        return false;
    } else if (!this.transformator.equals(other.transformator))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public String toString() {
    String result = new ToStringBuilder(this)
    	.addAllFields()
    	.toString();
    return result;
  }
  
  @Pure
  public MavenProject getProject() {
    return this.project;
  }
  
  @Pure
  public boolean isActivateCodeGen() {
    return this.activateCodeGen;
  }
  
  @Pure
  public File getTargetDirectory() {
    return this.targetDirectory;
  }
  
  @Pure
  public Code2ModelTransformator getTransformator() {
    return this.transformator;
  }
}

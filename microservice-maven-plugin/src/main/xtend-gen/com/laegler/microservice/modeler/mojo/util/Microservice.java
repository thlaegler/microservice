package com.laegler.microservice.modeler.mojo.util;

import java.io.File;
import org.apache.maven.model.Model;
import org.eclipse.xtend.lib.annotations.Data;
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor;
import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder;

@Data
@FinalFieldsConstructor
@SuppressWarnings("all")
public class Microservice {
  private final String name;
  
  private final Model pom;
  
  private final File directory;
  
  public Microservice(final String name, final Model pom, final File directory) {
    super();
    this.name = name;
    this.pom = pom;
    this.directory = directory;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.name== null) ? 0 : this.name.hashCode());
    result = prime * result + ((this.pom== null) ? 0 : this.pom.hashCode());
    result = prime * result + ((this.directory== null) ? 0 : this.directory.hashCode());
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
    Microservice other = (Microservice) obj;
    if (this.name == null) {
      if (other.name != null)
        return false;
    } else if (!this.name.equals(other.name))
      return false;
    if (this.pom == null) {
      if (other.pom != null)
        return false;
    } else if (!this.pom.equals(other.pom))
      return false;
    if (this.directory == null) {
      if (other.directory != null)
        return false;
    } else if (!this.directory.equals(other.directory))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public String toString() {
    ToStringBuilder b = new ToStringBuilder(this);
    b.add("name", this.name);
    b.add("pom", this.pom);
    b.add("directory", this.directory);
    return b.toString();
  }
  
  @Pure
  public String getName() {
    return this.name;
  }
  
  @Pure
  public Model getPom() {
    return this.pom;
  }
  
  @Pure
  public File getDirectory() {
    return this.directory;
  }
}

package com.laegler.microservice.adapter.model

import com.laegler.microservice.model.Architecture
import java.io.File
import java.util.List
import javax.inject.Named
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

@Named
@Accessors
class World {

	String name
	String basePackage
	String version
	String author

	Architecture architecture
	File baseFolder
	MavenProject mavenProject

	List<Project> projects

	public def String getOption(String key) {
		architecture.options.findFirst[containsKey(key)].get(key)
	}
	
	
}

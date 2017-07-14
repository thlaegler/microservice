package com.laegler.microservice.adapter.model

import org.eclipse.xtend.lib.annotations.Accessors
import com.laegler.microservice.model.microserviceModel.Architecture
import java.io.File
import org.apache.maven.project.MavenProject
import java.util.List
import com.laegler.microservice.model.microserviceModel.Option
import javax.inject.Named

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
//	List<Template> templates

	public def String getOption(String key) {
		architecture.artifacts.filter(Option).findFirst[name.equals(key)]?.value
	}
}

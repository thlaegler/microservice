package com.laegler.microservice.adapter.model

import com.laegler.microservice.model.Architecture
import java.io.File
import javax.inject.Singleton
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors

@Singleton
@Accessors
class World {

	String name
	String basePackage
	String version
	String author
	String vendor
	String vendorPrefix

	Architecture architecture
//	File rootFolder
//	MavenProject mavenProject

	Project rootProject

	public def String getOption(String key) {
		architecture?.options?.get(key) as String
	}

}

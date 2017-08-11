package com.laegler.microservice.adapter.model

import java.util.List
import javax.inject.Named
import org.apache.maven.model.Model
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import de.oehme.xtend.contrib.Buildable
import java.util.ArrayList

/**
 * Use ProjectBuilder to get instance.
 * 
 * @see ProjectBuilder
 */
@Named
@Buildable
@Accessors
@FinalFieldsConstructor
class Project {

	val String name
	val ProjectType projectType
	val String basePackage
	val String version
	val String canonicalName
	val String documentation

	val String directory

	val Model pom
	val Object microserviceModel

	List<Template> templates = new ArrayList
	List<Project> subProjects = new ArrayList

	def String getPackaging() {
		projectType?.packaging
	}

}

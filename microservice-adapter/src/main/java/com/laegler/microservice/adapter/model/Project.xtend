package com.laegler.microservice.adapter.model

import java.util.List
import javax.inject.Named
import org.apache.maven.model.Model
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

/**
 * Use ProjectBuilder to get instance.
 * 
 * @see ProjectBuilder
 */
@Named
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
	val EObject microserviceModel

	List<Template> templates
	List<Project> subProjects

	def String getPackaging() {
		projectType.packaging
	}

}
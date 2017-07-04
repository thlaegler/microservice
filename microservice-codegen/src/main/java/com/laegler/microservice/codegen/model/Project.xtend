package com.laegler.microservice.codegen.model

import com.laegler.microservice.codegen.template.base.AbstractTemplate
import java.util.ArrayList
import java.util.List
import org.apache.maven.model.Model
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@Data
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

	List<AbstractTemplate> templates = new ArrayList
	List<Project> subProjects = new ArrayList

	public def String getPackaging() {
		projectType.packaging
	}

}

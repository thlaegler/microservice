package com.laegler.microservice.codegen.model

import com.laegler.microservice.codegen.template.utils.AbstractTemplate
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

/**
 * 
 */
class Project {

	protected ModelWrapper model = ModelAccessor.model

	@Accessors String name
	@Accessors String basePackage
	@Accessors String relativePath
	@Accessors String version
	@Accessors List<String> dependencies
	@Accessors List<AbstractTemplate> files
	@Accessors ProjectType projectType
	@Accessors String canonicalName
	@Accessors String documentation

	new() {
		super()
		name = 'undefined-project'
		relativePath = '''undefined/«name»'''
		version = model.getOption('version').replaceFirst('v', '')
		dependencies = new ArrayList<String>
		files = new ArrayList<AbstractTemplate>
		projectType = ProjectType.UNDEFINED
		canonicalName = 'Undefined project'
		documentation = 'This is an undefined project (Generator is not implemented yet)'
	}

	public def String getPackaging() {
		projectType.packaging
	}

}

package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.template.base.AbstractTemplate
import com.laegler.microservice.codegen.model.Project

abstract class AbstractDocuTemplate extends AbstractTemplate {

	protected val String dotColorRest = 'firebrick'
	protected val String dotColorGrpc = 'dodgerblue'
	protected val String dotColorJar = 'grey'
	protected val String dotColorDraft = 'lightgrey'

	protected val String umlColorRest = '#Red'
	protected val String umlColorGrpc = '#Blue'
	protected val String umlColorJar = '#Grey'
	protected val String umlColorDraft = '#Lightgrey'

	new(Project project) {
		super(project)
	}

}

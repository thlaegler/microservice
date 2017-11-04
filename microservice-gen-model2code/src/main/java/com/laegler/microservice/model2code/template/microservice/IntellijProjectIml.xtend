package com.laegler.microservice.model2code.template.microservice

import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject

class IntellijProjectIml {

	private static final Logger LOG = LoggerFactory.getLogger(IntellijProjectIml)

	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		val relativPath = namingStrategy.getSrcPathWithPackage(p)
		LOG.debug('  Generating template: {}/README.MD', relativPath)

		Template::builder //
		.project(p) //
		.fileName('project') //
		.fileType(FileType.INTELLIJ_PROJECT) //
		.relativPath(relativPath) //
		.documentation('Intellij project file') //
		.skipStamping(true) //
		.content('''
			TODO
		''') //
		.build
	}

}

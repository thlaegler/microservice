package com.laegler.microservice.code2model.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.inject.Named
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.model.World
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import javax.inject.Inject

@Named
class SwaggerFile {

	protected static final Logger LOG = LoggerFactory.getLogger(SwaggerFile)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template SwaggerFile')

		templateBuilder //
		.project(project) //
		.fileName('') //
		.fileType(FileType.GITIGNORE) //
		.documentation('Git ignore file') //
		.relativPath(namingStrategy.getAbsoluteBasePath(project.name)) //
		.project(project) //
		.content('''
			TODO
		''').build
	}

}

package com.laegler.microservice.code2model.template

import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.inject.Named
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject

@Named
class ArchitectureFile {

	protected static final Logger LOG = LoggerFactory.getLogger(ArchitectureFile)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	Architecture architecture

	public def Template getTemplate(Project project, Architecture architecture) {
		LOG.debug('Generate template ArchitectureFile')

		this.architecture = architecture

		templateBuilder //
		.project(project) //
		.fileName('') //
		.fileType(FileType.GITIGNORE) //
		.documentation('Git ignore file') //
		.relativPath(namingStrategy.getAbsoluteBasePath(project.name)) //
		.skipStamping(true) //
		.content('''
			TODO
		''').build
	}
}

package com.laegler.microservice.code2model.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.inject.Named
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.model.World

@Named
class WsdlXml {

	protected static final Logger LOG = LoggerFactory.getLogger(ArchitectureFile)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template WsdlXml')

		templateBuilder //
		.project(project) //
		.fileName('wsdl') //
		.fileType(FileType.XML) //
		.documentation('SOAP WSDL') //
		.relativPath(namingStrategy.getAbsoluteSourcePath(project.name)) //
		.content('''
			TODO
		''') //
		.build
	}
}

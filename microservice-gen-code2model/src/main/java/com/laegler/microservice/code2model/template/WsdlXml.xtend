package com.laegler.microservice.code2model.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class WsdlXml {

	protected static Logger LOG = LoggerFactory.getLogger(WsdlXml)

	@Inject NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template WsdlXml')

		Template::builder //
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

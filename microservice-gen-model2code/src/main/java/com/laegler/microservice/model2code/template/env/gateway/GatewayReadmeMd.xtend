package com.laegler.microservice.model2code.template.env.gateway

import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject

class GatewayReadmeMd {

	private static final Logger LOG = LoggerFactory.getLogger(GatewayReadmeMd)

	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project p) {
		LOG.debug('  Generating template: {}/README.MD', '/')

		Template::builder //
		.project(p) //
		.fileName('README') //
		.fileType(FileType.MD) //
		.relativPath('/') //
		.documentation('Readme Markdown') //
		.skipStamping(true) //
		.content('''
			Auth service
		''') //
		.build
	}
}

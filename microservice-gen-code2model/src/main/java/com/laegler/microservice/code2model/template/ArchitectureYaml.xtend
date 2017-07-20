package com.laegler.microservice.code2model.template

import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Architecture
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class ArchitectureYaml {

	protected static Logger LOG = LoggerFactory.getLogger(ArchitectureYaml)

	@Inject YamlAdapter yamlAdapter

	@Inject TemplateBuilder templateBuilder

	public def Template getTemplate(Project p, Architecture a) {
		LOG.debug('Generate template ArchitectureYaml')

		templateBuilder //
		.project(p) //
		.fileName('architecture') //
		.fileType(FileType.YAML) //
		.documentation('Architecture Model') //
		.relativPath('/') //
		.skipStamping(true) //
		.content(yamlAdapter.serialize(a)).build
	}
}

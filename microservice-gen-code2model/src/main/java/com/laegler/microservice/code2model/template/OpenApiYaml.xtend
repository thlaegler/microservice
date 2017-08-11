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
class OpenApiYaml {

	protected static Logger LOG = LoggerFactory.getLogger(OpenApiYaml)

	@Inject NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template SwaggerFile')

		Template::builder //
		.project(project) //
		.fileName('api') //
		.fileType(FileType.YAML) //
		.documentation('OpenAPI specification') //
		.relativPath(namingStrategy.getAbsoluteBasePackagePath(project.basePackage)) //
		.project(project) //
		.content('''
			TODO
		''').build
	}

}

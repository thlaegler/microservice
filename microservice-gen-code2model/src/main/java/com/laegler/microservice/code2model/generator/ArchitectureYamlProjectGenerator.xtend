package com.laegler.microservice.code2model.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.lib.json.JsonAdapter
import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.template.PlantUml
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import javax.inject.Inject
import javax.inject.Named
import com.laegler.microservice.model.ModelRoot

@Named
class ArchitectureYamlProjectGenerator extends Generator {

	@Inject protected YamlAdapter yamlAdapter
	@Inject protected JsonAdapter jsonAdapter

	override Project generate(Architecture architecture) {
		// Create project from maven parent project
		val project = projectBuilder //
		.name(architecture.name) //
		.microserviceModel(architecture) //
		.build

		architecture.artifacts.filter(Artifact).forEach [ s |
			s.name = namingStrategy.getProjectName(s.name, '.docu')
			project.subProjects.addAll( // s.generateDocuProject
			)
		]

		project.templates.addAll(
			templateBuilder //
			.fileName('architecture') //
			.fileType(FileType.YAML) //
			.content(yamlAdapter.serialize(new ModelRoot => [it.architecture = architecture])) //
			.build,
			templateBuilder //
			.fileName('architecture') //
			.fileType(FileType.JSON) //
			.content(jsonAdapter.serialize(architecture)) //
			.build,
			new PlantUml().getTemplate(project)
		)
		project
	}
}

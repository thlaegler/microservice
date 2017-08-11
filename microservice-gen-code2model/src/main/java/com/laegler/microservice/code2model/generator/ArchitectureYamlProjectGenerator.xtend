package com.laegler.microservice.code2model.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.lib.json.JsonAdapter
import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import javax.inject.Inject
import javax.inject.Named
import com.laegler.microservice.model.ModelRoot
import java.util.List
import java.util.ArrayList
import com.laegler.microservice.adapter.model.template.PlantUmlComponentDiagram

@Named
class ArchitectureYamlProjectGenerator extends Generator {

	@Inject PlantUmlComponentDiagram plantUml
	@Inject YamlAdapter yamlAdapter
	@Inject JsonAdapter jsonAdapter

	override List<Project> generate(Architecture a) {
		LOG.debug('Generating YAML project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(a.generateProject)
		]
		projects
	}

	protected def Project generateProject(Architecture a) {
		LOG.debug('Generating REST parent project for {}', a.name)

		projectBuilder //
		.name(namingStrategy.getProjectName(a.name)) //
		.basePackage(world.basePackage) //
		.dir(namingStrategy.getProjectPath(a.name)) //
		.build => [ p |
			p.templates.addAll(
				templateBuilder //
				.fileName('architecture') //
				.fileType(FileType.YAML) //
				.content(yamlAdapter.serialize(new ModelRoot => [
					it.architecture = architecture
				])) //
				.build,
				templateBuilder //
				.fileName('architecture') //
				.fileType(FileType.JSON) //
				.content(jsonAdapter.serialize(a)) //
				.build,
				plantUml.getTemplate(p)
			)
		]
	}
}
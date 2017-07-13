package com.laegler.microservice.code2model.generator

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.Spring
import java.util.ArrayList
import java.util.List
import javax.inject.Named

/**
 * Project Generator for JSF/Faces Project
 */
@Named
class MicroserviceModelProjectGenerator extends Generator {

	List<Project> subProjects = new ArrayList
	List<Template> templates = new ArrayList

	override Project generate(Architecture a) {
		project = projectBuilder.name(a.name).microserviceModel(a).build
		world.projects.add(project)

		a.artifacts.filter(Spring).forEach [ s |
			s.name = s.name + '.docu'
			subProjects.addAll(
//				s.generateDocuProject
			)
		]
		project
	}
	
}

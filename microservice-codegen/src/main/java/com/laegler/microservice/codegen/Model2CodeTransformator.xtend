package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.generator.DocuProjectGenerator
import com.laegler.microservice.codegen.generator.GrpcProjectGenerator
import com.laegler.microservice.codegen.generator.RestProjectGenerator
import com.laegler.microservice.codegen.generator.SoapProjectGenerator
import com.laegler.microservice.codegen.model.FileHelper
import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.parent.docs.PlantUmlTemplate
import microserviceModel.Architecture
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl

class Model2CodeTransformator extends AbstractTransformator {

//	private static Logger LOG = LoggerFactory.getLogger(Model2CodeTransformator)

	extension FileHelper fileHelper

	val ModelWrapper model = ModelAccessor.model

	val soapProject = new SoapProjectGenerator
	val restProject = new RestProjectGenerator
	val grpcProject = new GrpcProjectGenerator
	val docuProject = new DocuProjectGenerator

	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	public def void generate(Architecture a) {
		model.projects.addAll(
			restProject.generate(a),
			grpcProject.generate(a),
			soapProject.generate(a),
			docuProject.generate(a)
		)

		model.projects.forEach [
			templates.forEach[toFile]
		]
	}

	/**
	 * Transform a Architecture Model into a maven project structure and write to file system.
	 */
	override transform(Architecture architecture) {
		super.transform(architecture)
	}

	def public String getPlantumlGraphFileContent(Architecture model) {
		new PlantUmlTemplate(Project.builder.microserviceModel(model).build).content
	}

}

package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.parent.docs.PlantUmlTemplate
import com.laegler.microservice.model.microserviceModel.Architecture
import java.io.File
import org.apache.maven.project.MavenProject
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import javax.inject.Named

@Named
class Model2CodeTransformator extends AbstractTransformator {

	private static final Logger LOG = LoggerFactory.getLogger(Model2CodeTransformator)

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		// Get Xtext Architecture file
//		val File architectureFile = mavenProject.getFile('*.architecture')
		val File architectureFile = new File('test.architecture')
		// Parse it
		val Architecture architecture = getArchitecture(architectureFile)
		architecture.generate
	}

	private def Architecture getArchitecture(File architectureFile) {
		var Architecture architecture
//		new StandaloneSetup().setPlatformUri("../")
//		val Injector injector = new ArchitectureLangStandaloneSetup().createInjectorAndDoEMFRegistration
//		val XtextResourceSet resourceSet = injector.getInstance(XtextResourceSet)
//		resourceSet.addLoadOption(XtextResource.OPTION_RESOLVE_ALL, Boolean.TRUE)
//		val Resource resource = resourceSet.createResource(URI.createURI("dummy:/example.architecture"))
//		val InputStream in = new ByteArrayInputStream("type foo type bar".bytes)
//		resource.load(in, resourceSet.loadOptions)
//		it = resource.getContents().get(0) as Architecture
		architecture
	}

	public def void generate(Architecture a) {
		model.projects.addAll(
			restProject.generate(a),
			grpcProject.generate(a),
			soapProject.generate(a),
			docuProject.generate(a)
		)

		model.projects.forEach [
			templates.forEach[fileHelper.toFile(it)]
		]
	}

	/**
	 * Transform a Architecture Model into a maven project structure and write to file system.
	 */
	override transform(Architecture architecture) {
		super.transform(architecture)
	}

	def public String getPlantumlGraphFileContent(Architecture model) {
		new PlantUmlTemplate(projectBuilder.microserviceModel(model).build).content
	}

}

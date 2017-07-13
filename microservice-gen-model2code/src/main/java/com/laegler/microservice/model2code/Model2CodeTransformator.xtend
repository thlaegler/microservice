package com.laegler.microservice.model2code

import com.laegler.microservice.model.microserviceModel.Architecture
import java.io.File
import java.util.Collection
import javax.inject.Named
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.WildcardFileFilter
import org.apache.maven.project.MavenProject
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model2code.generator.SoapProjectGenerator
import com.laegler.microservice.model2code.generator.RestProjectGenerator
import com.laegler.microservice.model2code.generator.GrpcProjectGenerator
import com.laegler.microservice.model2code.generator.DocuProjectGenerator
import javax.inject.Inject
import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.model.microserviceModel.Artifact

@Named
class Model2CodeTransformator extends AbstractTransformator {

	private static final Logger LOG = LoggerFactory.getLogger(Model2CodeTransformator)

	@Inject protected SoapProjectGenerator soapProject
	@Inject protected RestProjectGenerator restProject
	@Inject protected GrpcProjectGenerator grpcProject
	@Inject protected DocuProjectGenerator docuProject

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		// Get Xtext Architecture file
		val File architectureFile = getListOfAllConfigFiles(mavenProject.basedir.absolutePath).head
//		val File architectureFile = mavenProject.getFile('*.architecture')
//		val File architectureFile = new File('test.architecture')
		// Parse it
		LOG.info('Parsing architecture model from file {}', architectureFile)
		val Architecture architecture = getArchitecture(architectureFile)
		architecture.generate
	}

	private def Collection<File> getListOfAllConfigFiles(String directoryName) {
		LOG.info('Getting architecture model from directoryName {}', directoryName)
		val File directory = new File(directoryName);
		return FileUtils.listFiles(directory, new WildcardFileFilter("*.architecture"), null);
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
		LOG.info('Creating Projects')

		world.projects.addAll(
			restProject.generate(a),
			grpcProject.generate(a),
			soapProject.generate(a),
			docuProject.generate(a)
		)

		LOG.info('Writing cached model to file')

		world.projects.forEach [
			templates.forEach[fileHelper.toFile(it)]
		]
	}

	def void transform(Architecture architecture) {
		world.architecture = architecture
		architecture.artifacts.forEach [
			world.projects?.add(projectBuilder.name(world.name).microserviceModel(world.architecture as EObject).build)
		]

		architecture.artifacts.forEach[it.transform]

	// PlantUML graph
//		writeFile(architecture.plantumlGraphFileContent,
//			getFilePath(model.rootDirectory, 'architecture.component.plantuml'))
	// Maven POM graph
//		writeFile(new ParentPomXmlTemplate(architecture));
//		architecture.artifacts.forEach[it.transform]
	}

	def void transform(Artifact artifact) {
//		writeFile(new PomXmlTemplate(artifact));
	}

	def void transform(Spring spring) {
	}

	def public String getPlantumlGraphFileContent(Architecture model) {
		LOG.info('Creating file: microservice architecture PlantUML')

		new PlantUmlTemplate(projectBuilder.microserviceModel(model).build).content
	}

}

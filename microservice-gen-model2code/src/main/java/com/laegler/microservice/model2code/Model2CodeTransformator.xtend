package com.laegler.microservice.model2code

import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.adapter.lib.json.JsonAdapter
import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model2code.generator.DocuProjectGenerator
import com.laegler.microservice.model2code.generator.GrpcProjectGenerator
import com.laegler.microservice.model2code.generator.RestProjectGenerator
import com.laegler.microservice.model2code.generator.SoapProjectGenerator
import java.io.File
import java.util.Collection
import javax.inject.Inject
import javax.inject.Named
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.WildcardFileFilter
import org.apache.maven.project.MavenProject
import org.eclipse.emf.ecore.EObject
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model.ModelRoot
import com.laegler.microservice.model.Architecture

@Named
//@InjectWith(ArchitectureLangInjectorProvider)
class Model2CodeTransformator extends AbstractTransformator {

	private static final Logger LOG = LoggerFactory.getLogger(Model2CodeTransformator)

	@Inject protected YamlAdapter yamlAdapter
	@Inject protected JsonAdapter jsonAdapter

	@Inject protected SoapProjectGenerator soapProject
	@Inject protected RestProjectGenerator restProject
	@Inject protected GrpcProjectGenerator grpcProject
	@Inject protected DocuProjectGenerator docuProject

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		// Get Xtext Architecture file
		LOG.info('Searching for architecture.yml file')
		val File architectureFile = getListOfAllYmlConfigFiles(mavenProject.basedir.absolutePath).head
//		val File architectureFile = mavenProject.getFile('*.architecture')
//		val File architectureFile = new File('test.architecture')
		// Parse it
		LOG.info('Found for architecture.yml file: {}', architectureFile.absolutePath)
		val ModelRoot modelRoot = yamlAdapter.deserialize(fileHelper.asString(architectureFile))
//		LOG.info('Parsing architecture model from file {}', architectureFile)
//		val Architecture architecture = getArchitecture(architectureFile)
		LOG.info('Found for architecture model: {}.{}', modelRoot.architecture.basePackage, modelRoot.architecture.name)
		modelRoot.architecture.artifacts.forEach [
			LOG.info('  artifact: {}', it.name)
		]

		LOG.info('Trying to generate model to code')
		generate(modelRoot.architecture)
	}

	private def Collection<File> getListOfAllYmlConfigFiles(String directoryName) {
		LOG.info('Getting architecture model from directoryName {}', directoryName)
		val File directory = new File(directoryName);
		return FileUtils.listFiles(directory, new WildcardFileFilter("*architecture.yaml"), null);
	}

	private def Collection<File> getListOfAllJsonConfigFiles(String directoryName) {
		LOG.info('Getting architecture model from directoryName {}', directoryName)
		val File directory = new File(directoryName);
		return FileUtils.listFiles(directory, new WildcardFileFilter("*architecture.json"), null);
	}

	public def void generate(Architecture a) {
		LOG.info('Creating Projects')

		world.projects.addAll(
//			restProject.generate(a), //
			grpcProject.generate(a), //
//			soapProject.generate(a), // 
			docuProject.generate(a) //
		)

		LOG.info('Writing cached model to file')

		world.projects.forEach [
			templates.forEach [
				fileHelper.toFile(it)
			]
		]
	}

	def void transform(Architecture architecture) {
		world.architecture = architecture
		architecture.artifacts.forEach [
			world.projects?.add(
				projectBuilder //
				.name(world.name) //
				.microserviceModel(world.architecture as EObject) //
				.build //
			)
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
}

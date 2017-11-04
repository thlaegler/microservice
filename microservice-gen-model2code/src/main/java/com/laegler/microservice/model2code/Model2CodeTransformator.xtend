package com.laegler.microservice.model2code

import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.adapter.exception.GeneratorException
import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.ModelRoot
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import java.util.stream.Collectors
import javax.inject.Inject
import javax.inject.Named
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.WildcardFileFilter
import org.apache.maven.project.MavenProject
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.model2code.template.BaseProjectGenerator
import java.util.Arrays

@Named
class Model2CodeTransformator extends AbstractTransformator {

	private static final Logger LOG = LoggerFactory.getLogger(Model2CodeTransformator)

	@Inject YamlAdapter yamlAdapter

	@Inject BaseProjectGenerator baseProject

	public def void generate(File basedir) {
		generate(basedir, 'random', 'org.example')
	}

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		generate(mavenProject?.basedir, name, basePackage)
	}

	public def void generate(File basedir, String name, String basePackage) {
		LOG.debug('------------')
		LOG.debug(' Model2Code ')
		LOG.debug('------------')
		LOG.debug('Generating {}', basePackage + '.' + name, basedir.toString)
		LOG.debug('')

		if (basedir === null) {
			throw new GeneratorException('Maven base directory is not set.')
		}

		world.name = name
		world.basePackage = basePackage
//		world.mavenProject = mavenProject
//		world.rootFolder = mavenProject?.basedir
		// TODO: get values from maven properties
		world.author = 'johnDoe'
		world.vendor = 'myCompanyName'
		world.vendorPrefix = 'it'

		val ModelRoot modelRoot = parseMicroserviceArchitecture(basedir);

		LOG.debug('Trying to generate model to code ...')
		generate(modelRoot.architecture)

		LOG.debug('Successfully finished model to code')
		LOG.debug('')
	}

	public def void generate(Architecture a) {
		LOG.debug('Generating model to code ...')

		world.architecture = a

		LOG.debug('  World: {}', world)
		LOG.debug('  World.architecture: {}', world.architecture)
		LOG.debug('  World.architecture.artifacts: {}', world.architecture.artifacts)
		LOG.debug('  World.architecture?.artifacts?.filter(Artifact): {}',
			world.architecture?.artifacts?.filter(Artifact))

		LOG.debug('Generating base projects ...')
		world.rootProject = baseProject.generate(a).head
		LOG.debug('Generated {} projects', world.rootProject.subProjects.size)

		world.rootProject.subProjects.forEach [ p |
			LOG.debug('  project: {} in dir: {}', p.basePackage + '.' + p.name, p.directory)
			p.templates?.filter[t|t !== null].forEach [ t |
				LOG.debug('    template: {}', t?.fullPathWithName)
			]
		]

		LOG.debug('Write templates to file ...')
		world.rootProject.writeProject
	}

	def ModelRoot parseMicroserviceArchitecture(File basedir) {
		LOG.debug('Searching for architecture.yaml files in dir {}', basedir.toString)

		var File architectureFile = basedir
		if (basedir.isDirectory) {
			val candidateFiles = FileUtils.listFiles(basedir, new WildcardFileFilter("*rchitecture.y*l"),
				new WildcardFileFilter("*"))

			LOG.debug('Found following candidate files: {}', candidateFiles.toString)

			architectureFile = candidateFiles.head
		}

		LOG.debug('Found architecture.yaml file: {}', architectureFile.absolutePath)
		Files.lines(Paths.get(architectureFile.absolutePath)).collect(Collectors.toList).forEach [ line |
			LOG.debug(line);
		]

		LOG.debug('Parsing architecture.yaml file ...')
		val ModelRoot modelRoot = yamlAdapter.toModel(fileHelper.asString(architectureFile))

		LOG.debug('Parsed architecture model: {}.{}', modelRoot.architecture.basePackage, modelRoot.architecture.name)
		modelRoot.architecture.artifacts.forEach [
			LOG.debug('  artifact: {}', it.name)
		]
		modelRoot
	}

	def void writeProject(Project p) {
		LOG.debug('  project: {} in dir: {}', p.basePackage + '.' + p.name, p.directory)
		p.subProjects?.forEach [ sp |
			sp.writeProject
		]
		p.templates?.filter[t|t !== null].forEach [ t |
			LOG.debug('    template: {}', p.directory + '/' + t?.fullPathWithName)
			fileHelper.toFile(t, p)
		]
	}

	def void transform(Architecture a) {
		world.architecture = a
		a.artifacts.forEach [
			world.rootProject.subProjects?.add(
				Project::builder //
				.name(world.name) //
				.basePackage(a.basePackage) //
				.microserviceModel(a) //
				.build //
			)
		]
	}

}

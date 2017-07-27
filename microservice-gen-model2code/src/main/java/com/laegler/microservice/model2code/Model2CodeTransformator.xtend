package com.laegler.microservice.model2code

import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.adapter.exception.GeneratorException
import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.ModelRoot
import com.laegler.microservice.model2code.generator.BaseProjectGenerator
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

@Named
class Model2CodeTransformator extends AbstractTransformator {

	private static final Logger log = LoggerFactory.getLogger(Model2CodeTransformator)

	@Inject YamlAdapter yamlAdapter

	@Inject BaseProjectGenerator baseProject

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		log.debug('------------')
		log.debug(' Model2Code ')
		log.debug('------------')
		log.debug('Generating {}', basePackage + '.' + name, mavenProject.toString)
		log.debug('')

		if (mavenProject === null) {
			throw new GeneratorException('Maven model is null.')
		}

		world.name = name
		world.basePackage = basePackage
		world.mavenProject = mavenProject
		world.rootFolder = mavenProject?.basedir

		log.debug('Searching for architecture.yml file ...')
		val File architectureFile = FileUtils.listFiles(mavenProject.basedir,
			new WildcardFileFilter("*rchitecture.yml"), new WildcardFileFilter("*")).head

		log.debug('Found architecture.yml file: {}', architectureFile.absolutePath)
		Files.lines(Paths.get(architectureFile.absolutePath)).collect(Collectors.toList).forEach [ line |
			log.debug(line);
		]

		log.debug('Parsing architecture.yml file ...')
		val ModelRoot modelRoot = yamlAdapter.deserialize(fileHelper.asString(architectureFile))

		log.debug('Parsed architecture model: {}.{}', modelRoot.architecture.basePackage, modelRoot.architecture.name)
		modelRoot.architecture.artifacts.forEach [
			log.debug('  artifact: {}', it.name)
		]

		log.debug('Trying to generate model to code ...')
		generate(modelRoot.architecture)

		log.debug('Successfully finished model to code')
		log.debug('')
	}

	public def void generate(Architecture a) {
		log.debug('Generating model to code ...')

		world.architecture = a

		log.debug('  World: {}', world)
		log.debug('  World.architecture: {}', world.architecture)
		log.debug('  World.architecture.artifacts: {}', world.architecture.artifacts)
		log.debug('  World.architecture?.artifacts?.filter(Artifact): {}',
			world.architecture?.artifacts?.filter(Artifact))

		log.debug('Generating base projects ...')
		world.rootProject = baseProject.generate(a).head
		log.debug('Generated {} projects', world.rootProject.subProjects.size)

		world.rootProject.subProjects.forEach [ p |
			log.debug('  project: {} in dir: {}', p.basePackage + '.' + p.name, p.directory)
			p.templates?.filter[t|t !== null].forEach [ t |
				log.debug('    template: {}', t?.fullPathWithName)
			]
		]

		log.debug('Write templates to file ...')
		world.rootProject.writeProject
	}

	def void writeProject(Project p) {
		log.debug('  project: {} in dir: {}', p.basePackage + '.' + p.name, p.directory)
		p.subProjects?.forEach [ sp |
			sp.writeProject
		]
		p.templates?.filter[t|t !== null].forEach [ t |
			log.debug('    template: {}', p.directory + '/' + t?.fullPathWithName)
			fileHelper.toFile(t, p)
		]
	}

	def void transform(Architecture a) {
		world.architecture = a
		a.artifacts.forEach [
			world.rootProject.subProjects?.add(
				projectBuilder //
				.name(world.name) //
				.basePackage(a.basePackage) //
				.microserviceModel(a) //
				.build //
			)
		]
	}

}

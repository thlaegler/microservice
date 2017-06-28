package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.YamlConfig
import java.io.File
import java.io.FileInputStream
import java.io.FileNotFoundException
import java.io.FileReader
import java.io.InputStream
import java.util.List
import microserviceModel.Architecture
import microserviceModel.Artifact
import microserviceModel.GrpcConsume
import microserviceModel.MicroserviceModelFactory
import microserviceModel.RestConsume
import microserviceModel.Spring
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.model.Dependency
import org.apache.maven.model.Model
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.apache.maven.project.MavenProject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.yaml.snakeyaml.Yaml
import org.yaml.snakeyaml.constructor.Constructor

class AbstractTransformator {

	private static Logger LOG = LoggerFactory.getLogger(AbstractTransformator)

	protected val ModelWrapper model = ModelAccessor.model

	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl
	extension MavenXpp3Reader mavenreader = new MavenXpp3Reader
//	extension TemplateProvider templateProvider = new TemplateProvider

	protected def void transform(MavenProject mavenProject) {
		model.mavenProject = mavenProject
		mavenProject.model.transform
	}

	protected def void transform(Model pom) {
		pom.modules.forEach [
			model.projects.add(
				Project.builder.name(pom.artifactId).microserviceModel(model as EObject).build
			)
		]

//		() => [basedir.transform]
	}

	public def void transform(Architecture architecture) {
		model.architecture = architecture
		model.name = ''
		architecture.artifacts.forEach [
			model.projects.add(Project.builder.name(model.name).microserviceModel(model.architecture as EObject).build)
		]

		architecture.artifacts.forEach[it.transform]

		// PlantUML graph
//		writeFile(architecture.plantumlGraphFileContent,
//			getFilePath(model.rootDirectory, 'architecture.component.plantuml'))

		// Maven POM graph
//		writeFile(new ParentPomXmlTemplate(architecture));

		architecture.artifacts.forEach[it.transform]
	}

	protected def void transform(Resource resource) {
//		model.architecture = resource.allContents.filter(Architecture).findFirst[]
//		model.architecture = (resource?.contents?.head as Architecture)
		model.architecture.artifacts.forEach [
//			templateProvider.generateFile(template)
		]
	}

	protected def void transform(File rootDir) {
		model.rootDirectory = rootDir
		rootDir?.listFiles?.filter [
			it?.listFiles != null
		].forEach[transform(it, it.name)]
	}

	protected def void transform(File projectDir, String projectName) {
		var File pomXmlFile = projectDir?.listFiles?.findFirst [
			it.name.equals('pom.xml')
		]
		val Model pom = read(new FileReader(pomXmlFile))

//			if (!model.artifactId?.equals(pomXmlFile?.name)) {}
		if (pom != null) {
			model.projects.add(Project.builder.name(pom.artifactId).pom(pom).build)
		}
//		writeFile(model.projects.dotGraphFileContent2, projectDir.getFilePath('architecture.component.plantuml'))
		model.projects.transform
	}

	protected def void transform(List<Project> projects) {
		projects?.forEach[transform]
	}

	protected def void transform(Artifact artifact) {
//		writeFile(new PomXmlTemplate(artifact));
	}

	protected def void transform(Spring spring) {
	}

	protected def void transform(Project m) {
//		writeFile(m.subsetFileContent, m.getFilePath('''«m.name»-subset.txt'''))
//		writeFile(m.kubeFileContent, m.getFilePath('''«m.name»-kube.yml'''))
	}

	protected def String getSubsetContent(Spring spring) '''
		«spring?.name»
		«FOR consume : spring?.consumes»
			«IF consume instanceof RestConsume»
				«consume?.target?.name»
			«ENDIF»
			«IF consume instanceof GrpcConsume»
				«consume?.target?.name»
			«ENDIF»
		«ENDFOR»
		«FOR use : spring?.dependencies»
			«use?.target?.name»
		«ENDFOR»
	'''

	protected def String getSubsetFileContent(Project m) '''
		«FOR Dependency d : m.pom.dependencies»
			«IF d.groupId==m.pom.groupId»
				«d.artifactId»
			«ENDIF»
		«ENDFOR»
	'''

	protected def String getKubeFileContent(Project m) '''
		pod: «m.name»
	'''

	

	protected def String getSpringApplicationFileContent(Project m) {
//		m.directory.listFiles.filter[it?.listFiles?.c]
		val Constructor constructor = new Constructor(YamlConfig);
		val Yaml yaml = new Yaml(constructor);

		var InputStream input = null;
		try {
			input = new FileInputStream(new File('/tmp/apps.yml'))
		} catch (FileNotFoundException e) {
			e.printStackTrace
		}
		val YamlConfig data = yaml.loadAs(input, YamlConfig)
		''
	}



	protected def String getFormatted(String description) {
		if (description.nullOrEmpty) {
			return ''
		} else {
			return ''' («description»)'''
		}
	}

	protected def String getClean(String identifier) {
		return identifier?.replaceAll('[^a-zA-Z0-9]', '')
	}

	protected def String getFilePath(File path, String filename) '''«path»«File.separator»«filename»'''

	protected def String getFilePath(Project m, String filename) '''«m.directory»«File.separator»«filename»'''

}

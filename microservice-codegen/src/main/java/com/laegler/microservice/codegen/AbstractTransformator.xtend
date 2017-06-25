package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.model.Microservice
import guru.nidi.graphviz.engine.Format
import guru.nidi.graphviz.engine.Graphviz
import guru.nidi.graphviz.model.Graph
import java.io.File
import java.io.FileReader
import java.nio.charset.Charset
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import microserviceModel.Architecture
import microserviceModel.GrpcConsume
import microserviceModel.GrpcExpose
import microserviceModel.GrpcJar
import microserviceModel.Jar
import microserviceModel.RestConsume
import microserviceModel.RestExpose
import microserviceModel.Spring
import org.apache.commons.io.FileUtils
import org.apache.maven.model.Dependency
import org.apache.maven.model.Model
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.apache.maven.project.MavenProject

import static guru.nidi.graphviz.model.Factory.*
import com.laegler.microservice.codegen.model.YamlConfig
import org.yaml.snakeyaml.constructor.Constructor
import org.yaml.snakeyaml.Yaml
import java.io.InputStream
import java.io.FileInputStream
import java.io.FileNotFoundException
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import org.eclipse.emf.ecore.EObject
import microserviceModel.Artifact
import com.laegler.microservice.codegen.model.TemplateProvider
import org.eclipse.emf.ecore.resource.Resource
import com.laegler.microservice.codegen.template.microservice.PomXmlTemplate
import com.laegler.microservice.codegen.template.utils.AbstractTemplate
import com.laegler.microservice.codegen.template.ParentPomXmlTemplate

class AbstractTransformator {

	protected val String dotColorRest = 'firebrick'
	protected val String dotColorGrpc = 'dodgerblue'
	protected val String dotColorJar = 'grey'
	protected val String dotColorDraft = 'lightgrey'

	protected val String umlColorRest = '#Red'
	protected val String umlColorGrpc = '#Blue'
	protected val String umlColorJar = '#Grey'
	protected val String umlColorDraft = '#Lightgrey'

	protected val ModelWrapper model = ModelAccessor.model

	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl
	extension MavenXpp3Reader mavenreader = new MavenXpp3Reader
	extension TemplateProvider templateProvider = new TemplateProvider

	protected def void transform(MavenProject parentProject) {
		(model.mavenProject = parentProject) => [basedir.transform]
	}

	protected def void transform(Architecture architecture) {
		model.architecture = architecture

		writeFile(architecture.plantumlGraphFileContent,
			getFilePath(model.rootDirectory, 'architecture.component.plantuml'))
		writeFile(new ParentPomXmlTemplate);

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
			model.microservices.add(new Microservice => [
				it.name = pom.artifactId
				it.pom = pom
				it.model = createArchitecture as EObject
				it.directory = projectDir
			])
		}
		writeFile(model.microservices.dotGraphFileContent2, projectDir.getFilePath('architecture.component.plantuml'))
		model.microservices.transform
	}

	protected def void transform(List<Microservice> microservices) {
		microservices?.forEach[transform]
	}

	protected def void transform(Artifact artifact) {
		val Microservice m = new Microservice => [
			it.name = artifact.name
			it.pom = new Model
			it.model = artifact as EObject
		]
		model.microservices.add(m)
		writeFile(new PomXmlTemplate(m));
	}

	protected def void transform(Spring spring) {
	}

	protected def void transform(Microservice m) {
		writeFile(m.subsetFileContent, m.getFilePath('''«m.name»-subset.txt'''))
		writeFile(m.kubeFileContent, m.getFilePath('''«m.name»-kube.yml'''))
	}

	protected def String getDotGraphFileContent(Architecture model) {
		val services = new ArrayList<String>()
		services.add("digraph Microservices {");
		services.add(' ');

		model.artifacts.filter(Spring).forEach [
			val service = it as Spring
			service => [
				services.add('''	subgraph "cluster_«service.name»" {''')
				services.add('''		color=black;''')
				services.add('''		shape=box;''')
				services.add('''		label = "«service.type.literal»: «service.name»";''')
				services.add('''		"«service.name»" [label="«service.name»", shape=box];''')
				exposes.filter(RestExpose).forEach [
					var color = dotColorRest
					if (it.draft) {
						color = dotColorDraft
					}
					services.
						add('''		"REST: «it.name»" [label="REST: «it.name» \n «it.port»", style=filled, color=«color», fontname=arial, fontsize=8];''')
					services.
						add('''		"REST: «it.name»" -> "«service.name»" [label="exposes", arrowhead=dot, color=«color», fontname=arial, fontsize=8];''')
				]
				exposes.filter(GrpcExpose).forEach [
					var color = dotColorGrpc
					if (it.draft) {
						color = dotColorDraft
					}
					services.
						add('''		"GRPC: «it.name»" [label="GRPC: «it.name» \n «it.port»", style=filled, color=«color», fontname=arial, fontsize=8];''')
					services.
						add('''		"GRPC: «it.name»" -> "«service.name»" [label="exposes", arrowhead=dot, color=«color», fontname=arial, fontsize=8];''')
				]
				dependencies.forEach [
					var String label = it?.target?.name
					if (it.target == null) {
						label = it.name
					}
					services.
						add('''		"«service.name»«label».jar" [label="«label».jar", shape=box, style=filled, fontname=arial, fontsize=8, color=«dotColorJar»];''');
					services.
						add('''		"«service.name»" -> "«service.name»«label».jar" [label="uses JAR", color=«dotColorJar», fontname=arial, fontsize=8];''')
				]
				services.add('''	}''')

				consumes.filter(RestConsume).forEach [
					services.
						add('''	"«service.name»" -> "REST: «it.target.name»" [label="consumes«it.description.formatted»", color=«dotColorRest», fontname=arial, fontsize=8];''')
				]
				consumes.filter(GrpcConsume).forEach [
					services.
						add('''	"«service.name»" -> "GRPC: «it.target.name»" [label="consumes«it.description.formatted»", color=«dotColorGrpc», fontname=arial, fontsize=8];''')
				]
			]
		]

		services.add(' ');
		services.add("}");
		services.join(System.getProperty('line.separator'))
	}

	protected def String getPlantumlGraphFileContent(Architecture model) {
		val services = new ArrayList<String>()
		services.add('@startuml')
		services.add('skinparam componentStyle uml2')
		services.add(
			'''skinparam interface {
			backgroundColor RosyBrown
			borderColor orange}'''
		)
		services.add(
			'''
			sprite $dependency [16x16/16] {
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFF0FFFFF
				FFFFFFFFFF00FFFF
				FF00000000000FFF
				FF000000000000FF
				FF00000000000FFF
				FFFFFFFFFF00FFFF
				FFFFFFFFFF0FFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
				FFFFFFFFFFFFFFFF
			}'''
		)
		services.add(' ')
		model?.artifacts?.filter(Jar).forEach [
			val jar = it as Jar
			val jarName = jar?.name
			jar => []
		]
		model?.artifacts?.filter(GrpcJar).forEach [
			val jar = it as GrpcJar
			val jarName = jar?.name
			jar => [
				protoFile
			]
		]
		model?.artifacts?.filter(Spring).forEach [
			val service = it as Spring
			val serviceName = service?.name
			service => [
				services.add('''node "«service?.type?.literal»: «serviceName»" {''')
				services.add('''	component "«serviceName»" as «serviceName.clean»''')
				exposes?.filter(RestExpose).forEach [
					var color = umlColorRest
					if (it.draft) {
						color = umlColorDraft
					}
					services.add('''	interface "«it?.name» «it?.port»" as «it?.name.clean» «color»''')
					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name.clean» : exposes''')
				]
				exposes?.filter(GrpcExpose).forEach [
					var color = umlColorGrpc
					if (it.draft) {
						color = umlColorDraft
					}
					services.add('''	interface "«it?.name» «it.port»" as «it?.name.clean» «color»''')
					services.add('''	[«serviceName.clean»] -[«color»]-> () «it?.name» : exposes''')
				]
				dependencies?.forEach [
					var String label = it?.target?.name + '.jar'
					if (it.target == null) {
						label = it?.name + '.jar'
					}
					services.
						add('''	rectangle "«label»" <<$dependency>> as «service?.name.clean»«label.clean» «umlColorJar»''');
					services.
						add('''	[«serviceName.clean»] -[«umlColorJar»]-> «service?.name.clean»«label.clean» : uses''')
				]
				services.add('}')
				services.add(' ')
				consumes?.filter(RestConsume).forEach [
					services.
						add('''[«serviceName.clean»] -[«umlColorRest»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
				]
				consumes?.filter(GrpcConsume).forEach [
					services.
						add('''[«serviceName.clean»] -[«umlColorGrpc»]-> () «it?.target?.name?.clean» : consumes«it?.description.formatted»''')
				]
				services.add(' ')
			]
		]
		services.add('@enduml')
		services.join(System.getProperty('line.separator'))
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

	protected def String getSubsetFileContent(Microservice m) '''
		«FOR Dependency d : m.pom.dependencies»
			«IF d.groupId==m.pom.groupId»
				«d.artifactId»
			«ENDIF»
		«ENDFOR»
	'''

	protected def String getKubeFileContent(Microservice m) '''
		pod: «m.name»
	'''

	protected def String getDotGraphFileContent() '''
	'''

	protected def String dotGraphFileContent2(List<Microservice> microservices) {
		val Graph g = graph('Microservices').directed.with(node('a'))
		val Map<String, Graph> mSubGraph = new HashMap
		microservices?.forEach [ m |
			val Graph s = graph(m.name).directed.cluster.with(node(m.name).with('color', 'black').with('shape', 'box'))
			g.with(s)
			mSubGraph.put(m.name, s)
		]
		microservices?.forEach [ m |
			m.pom => [
				val domainComponent = mSubGraph.get(artifactId).with(node(m.name).with('shape', 'box'))
				mSubGraph.get(artifactId).with(domainComponent)
				dependencies.filter[d|groupId == d.groupId].forEach [ d |
					domainComponent.link(
						node(d.artifactId + '.jar').with('color', dotColorJar).with('label', 'uses JAR'))
				]
			]
		]
		Graphviz.fromGraph(g).width(800).render(Format.PNG).toString
	}

	protected def String getDotGraphFile3(List<Microservice> microservices) {
		val services = new ArrayList<String>()
		services.add("digraph Microservices {");
		services.add(' ');

		microservices?.forEach [ m |
			m.pom => [
				services.add('''	subgraph "cluster_«artifactId»" {''')
				services.add('''		color=black;''')
				services.add('''		shape=box;''')
				services.add('''		label = "Service: «artifactId»";''')
				services.add('''		"«artifactId»" [label="«artifactId»", shape=box];''')
				dependencies.filter[d|groupId == d.groupId].forEach [ d |
					services.
						add('''		"«artifactId»«d.artifactId».jar" [label="«d.artifactId».jar", shape=box, style=filled, fontname=arial, fontsize=8, color=«dotColorJar»];''');
					services.
						add('''		"«artifactId»" -> "«artifactId»«d.artifactId».jar" [label="uses JAR", color=«dotColorJar», fontname=arial, fontsize=8];''')
				]
				services.add('''	}''')
			]
		]

		services.add(' ');
		services.add("}");
		services.join(System.getProperty('line.separator'))
	}

	protected def String getSpringApplicationFileContent(Microservice m) {
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

	protected def void writeFile(AbstractTemplate template) {
		FileUtils.writeStringToFile(
			new File(template.fullPathWithName) => [
				parentFile.mkdirs
				createNewFile
			],
			template.fileContent,
			Charset.defaultCharset()
		)
	}

	protected def void writeFile(String content, String pathname) {
		FileUtils.writeStringToFile(
			new File(pathname) => [
				parentFile.mkdirs
				createNewFile
			],
			content,
			Charset.defaultCharset()
		)
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

	protected def String getFilePath(Microservice m, String filename) '''«m.directory»«File.separator»«filename»'''
}

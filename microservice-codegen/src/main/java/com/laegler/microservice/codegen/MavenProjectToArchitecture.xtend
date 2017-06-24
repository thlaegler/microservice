package com.laegler.microservice.codegen

import java.util.List
import com.laegler.microservice.codegen.model.Microservice
import org.apache.commons.io.FileUtils
import java.io.File
import java.nio.charset.Charset
import java.io.File
import java.util.List
import org.apache.maven.plugin.AbstractMojo
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.project.MavenProject
import org.apache.commons.io.FileUtils
import java.util.Map
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.apache.maven.model.Model
import java.io.FileReader
import java.nio.charset.Charset
import java.util.ArrayList

import static guru.nidi.graphviz.attribute.Attributes.*
import static guru.nidi.graphviz.attribute.Records.*
import static guru.nidi.graphviz.engine.Format.*
import static guru.nidi.graphviz.engine.Rasterizer.*
import static guru.nidi.graphviz.model.Compass.*
import static guru.nidi.graphviz.model.Factory.*
import static guru.nidi.graphviz.model.Link.*
import guru.nidi.graphviz.engine.Graphviz
import guru.nidi.graphviz.engine.Format
import guru.nidi.graphviz.model.Graph
import java.util.HashMap
import org.apache.maven.model.Dependency

class MavenProjectToArchitecture {

	val String dotColorRest = 'firebrick'
	val String dotColorGrpc = 'dodgerblue'
	val String dotColorJar = 'grey'
	val String dotColorDraft = 'lightgrey'

	var MavenProject parentProject
	extension MavenXpp3Reader mavenreader = new MavenXpp3Reader

	public def transform(MavenProject parentProject) {
		this.parentProject = parentProject => [basedir.transform]
	}

	protected def transform(File rootDir) {
		val List<Microservice> microservices = new ArrayList
		rootDir?.listFiles?.filter[it?.listFiles != null].forEach [ File m |
			var File pomXmlFile = m?.listFiles?.findFirst[it.name.equals('pom.xml')]
			var Model model = read(new FileReader(pomXmlFile))
//			if (!model.artifactId?.equals(pomXmlFile?.name)) {}
			if (model != null)
				microservices.add(new Microservice(model?.artifactId, model, m, rootDir))
		]
		createAndWriteFile(microservices.dotGraphFileContent2, rootDir.getFilePath('architecture.component.plantuml'))

		microservices.transform
	}

	protected def transform(List<Microservice> microservices) {
		microservices?.forEach[transform]
	}

	protected def transform(Microservice m) {
		createAndWriteFile(m.subsetFileContent, m.getFilePath('''«m.name»-subset.txt'''))
		createAndWriteFile(m.kubeFileContent, m.getFilePath('''«m.name»-kube.yml'''))
	}

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

	private def createAndWriteFile(String content, String pathname) {
		FileUtils.writeStringToFile(
			new File(pathname) => [
				parentFile.mkdirs
				createNewFile
			],
			content,
			Charset.defaultCharset()
		)
	}

	private def String getFilePath(File path, String filename) '''«path»«File.separator»«filename»'''

	private def String getFilePath(Microservice m, String filename) '''«m.directory»«File.separator»«filename»'''
}

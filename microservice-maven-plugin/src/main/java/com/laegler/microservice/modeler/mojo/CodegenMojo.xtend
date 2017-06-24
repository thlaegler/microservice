package com.laegler.microservice.modeler.mojo

import java.io.File
import java.util.List
import org.apache.maven.plugins.annotations.Parameter
import org.apache.maven.plugins.annotations.Mojo
import org.apache.maven.plugins.annotations.LifecyclePhase
import org.apache.maven.plugin.AbstractMojo
import org.apache.maven.plugin.MojoExecutionException
import org.apache.maven.plugins.annotations.ResolutionScope
import org.apache.maven.plugin.MojoFailureException
import org.apache.maven.project.MavenProject
import org.apache.commons.io.FileUtils
import java.util.Map
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.apache.maven.model.Model
import java.io.FileReader
import com.laegler.microservice.modeler.mojo.util.Microservice
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

//@org.eclipse.xtend.lib.annotations.Data
@Mojo(name="codegen", defaultPhase=LifecyclePhase.
	GENERATE_SOURCES, threadSafe=true, requiresDependencyResolution=ResolutionScope.COMPILE)
class CodegenMojo extends AbstractMojo {

	@Parameter(defaultValue="${project}", readonly=true)
	var MavenProject project

	@Parameter(property="skipCodeGen", defaultValue="false", required=false, readonly=true)
	var boolean skipCodeGen

	@Parameter(property="targetDirectory", defaultValue="${project.build.outputDirectory}/generated", required=false, readonly=true)
	var File targetDirectory

	var File baseDir
	var String projectEncoding
	val List<Microservice> microservices = new ArrayList

	val MavenXpp3Reader mavenreader = new MavenXpp3Reader

	val String dotColorRest = 'firebrick'
	val String dotColorGrpc = 'dodgerblue'
	val String dotColorJar = 'grey'
	val String dotColorDraft = 'lightgrey'

	override void execute() throws MojoExecutionException, MojoFailureException {
		if (skipCodeGen) {
			log.info('Code Generation is skipped.')
			return
		}

		baseDir = project?.basedir
		projectEncoding = project?.properties?.getProperty('project.build.sourceEncoding')
		baseDir?.listFiles?.filter[it?.listFiles != null].forEach [ File m |
			var File pomXmlFile = m?.listFiles?.findFirst[it.name.equals('pom.xml')]
			var Model model = mavenreader.read(new FileReader(pomXmlFile))
			if (!model.artifactId?.equals(pomXmlFile?.name)) {
				log.warn('Project name and Folder name are not equal.')
			}
			if (model != null)
				microservices.add(new Microservice(model?.artifactId, model, m))
		]
		microservices?.forEach[createMicroservice]

		createAndWriteFile(dotGraphFile2, createFileName(baseDir, 'architecture.component.plantuml'))
	}

	def createMicroservice(Microservice m) {
		createAndWriteFile(m.subsetFile, createFileName(m.directory, 'subset.txt'))
		createAndWriteFile(m.kubeFile, createFileName(m.directory, 'subset.txt'))
	}

	def String getSubsetFile(Microservice microservice) '''
'''

	def String getKubeFile(Microservice microservice) '''
'''

	def String getDotGraphFile() '''
		«FOR m : microservices»
			
		«ENDFOR»
	'''

	def String getDotGraphFile2() {
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
					domainComponent.link(node(d.artifactId+'.jar').with('color', dotColorJar).with('label', 'uses JAR'))
				]
			]
		]
		Graphviz.fromGraph(g).width(800).render(Format.PNG).toString
	}

	def String getDotGraphFile3() {
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

	private def File createFile(String suffix, String extenzion) {
		project.artifactId
		val String path = '''«File.separator»«project.artifactId»-«suffix».«extenzion»''';
		val File file = new File('''«File.separator»«project.artifactId»-«suffix».«extenzion»''');
		file.getParentFile().mkdirs();
		file.createNewFile();
		file
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

	private def String createFileName(File dir, String filename) '''«dir»«File.separator»«filename»'''
}

package com.laegler.microservice.model2code.template.parent.docs

import com.laegler.microservice.adapter.util.FileType
import com.laegler.microservice.adapter.util.Project
import com.laegler.microservice.model2code.template.base.AbstractDocuTemplate
import guru.nidi.graphviz.engine.Format
import guru.nidi.graphviz.engine.Graphviz
import guru.nidi.graphviz.model.Graph
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map

import static guru.nidi.graphviz.model.Factory.*

class DotGraphTemplate extends AbstractDocuTemplate {
	
	new(Project project) {
		super(project)
		
		fileName = 'architecture.dot'
		fileType = FileType.UNDEFINED
		
		content = project.subProjects.template
	}
	
	protected def String dotGraphFileContent2(List<Project> projects) {
		val Graph g = graph('Projects').directed.with(node('a'))
		val Map<String, Graph> mSubGraph = new HashMap
		projects?.forEach [ m |
			val Graph s = graph(m.name).directed.cluster.with(node(m.name).with('color', 'black').with('shape', 'box'))
			g.with(s)
			mSubGraph.put(m.name, s)
		]
		projects?.forEach [ m |
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

	protected def String getTemplate(List<Project> projects) {
		val services = new ArrayList<String>()
		services.add("digraph Projects {");
		services.add(' ');

		projects?.forEach [ m |
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
}
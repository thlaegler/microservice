package com.laegler.microservice.model2code.template.microservice.soap

import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import java.io.StringWriter
import javax.inject.Inject
import javax.inject.Named
import org.apache.maven.model.Model
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class SoapAggregatorPomXml extends PomXml {

	protected static final Logger log = LoggerFactory.getLogger(SoapAggregatorPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		log.debug('  Generating template pom.xml')

		val contentWriter = new StringWriter
		mavenWriter.write(contentWriter, getModel(p))

		templateBuilder //
		.project(p) //
		.content(contentWriter.toString) //
		.build //
	}

	private def getModel(Project p) {
		new Model => [
			groupId = p.basePackage
			artifactId = p.name
			version = p.version
			packaging = p.packaging
			name = world.name.toLowerCase + ' ' + p.name.toLowerCase
			modules => [
				add(p.name.toLowerCase + 'model')
				add(p.name.toLowerCase + 'server')
				add(p.name.toLowerCase + 'client')
			]
		]
	}
}

package com.laegler.microservice.model2code.template

import com.laegler.microservice.adapter.model.FileType
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
class RootPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(RootPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		LOG.debug('  Generating template pom.xml')

		templateBuilder //
		.project(p) //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.content(p.content) //
		.build //
	}

	private def String getContent(Project p) {
		val contentWriter = new StringWriter
		mavenWriter.write(contentWriter, getModel(p))
		contentWriter.toString
	}

	private def getModel(Project p) {
		new Model => [
			groupId = p.basePackage
			artifactId = p.name
			version = p.version
		]
	}
}

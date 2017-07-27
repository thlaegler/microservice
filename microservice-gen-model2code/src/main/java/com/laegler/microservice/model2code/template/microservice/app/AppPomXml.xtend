package com.laegler.microservice.model2code.template.microservice.app

import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import org.apache.maven.model.Model
import java.io.StringWriter
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.FileType

@Named
class AppPomXml extends PomXml {

	protected static final Logger log = LoggerFactory.getLogger(AppPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		log.debug('  Generating template /app/pom.xml')

		val contentWriter = new StringWriter
		mavenWriter.write(contentWriter, getModel(p))

		templateBuilder //
		.project(p) //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.content(contentWriter.toString) //
		.build //
	}

	private def getModel(Project p) {
		new Model => [
			groupId = p.basePackage
			artifactId = p.name
			version = p.version
		]
	}
}

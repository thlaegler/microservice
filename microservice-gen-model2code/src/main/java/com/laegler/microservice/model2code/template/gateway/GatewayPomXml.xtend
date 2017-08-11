package com.laegler.microservice.model2code.template.gateway

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Named
import org.apache.maven.model.Model
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.io.StringWriter
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import javax.inject.Inject

@Named
class GatewayPomXml extends PomXml {

	protected static final Logger log = LoggerFactory.getLogger(GatewayPomXml)

	@Inject MavenXpp3Writer mavenWriter
	
	public def Template getTemplate(Project p) {
		log.debug('  Generating template pom.xml')

		val contentWriter = new StringWriter
		mavenWriter.write(contentWriter, getModel(p))
		
		templateBuilder //
		.project(p) //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.content(contentWriter.toString)
//		.content('''
//			<groupId>com.laegler.microservice.example.code2model</groupId>
//			<artifactId>«p.name.toLowerCase»</artifactId>
//			<version>«p.version»</version>
//			<packaging>«p.packaging»</packaging>
//			<name>«world.name.toLowerCase» «p.name.toLowerCase»</name>
//			<modules>
//				<module>«p.name.toLowerCase».model</module>
//				<module>«p.name.toLowerCase».business</module>
//				<module>«p.name.toLowerCase».soap</module>
//				<module>«p.name.toLowerCase».rest</module>
//				<module>«p.name.toLowerCase».grpc</module>
//				<module>«p.name.toLowerCase».app</module>
//			</modules>
//		''') //
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
				add(p.name.toLowerCase + 'business')
				add(p.name.toLowerCase + 'soap')
				add(p.name.toLowerCase + 'rest')
				add(p.name.toLowerCase + 'grpc')
				add(p.name.toLowerCase + 'app')
			]
		]
	}
}

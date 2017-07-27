package com.laegler.microservice.adapter.model

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.annotation.PostConstruct
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import javax.inject.Inject
import com.laegler.microservice.adapter.util.NamingStrategy

abstract class PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(PomXml)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	@PostConstruct
	public def void prepareTemplateBuilder() {
		templateBuilder //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.header('''
			<project
				xmlns="http://maven.apache.org/POM/4.0.0"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
					http://maven.apache.org/xsd/maven-4.0.0.xsd">
				<modelVersion>4.0.0</modelVersion>
		''') //
		.footer('</project>') //
		.documentation('Maven project object model (pom.xml)') //
	}

	/**
	 * Parent section in POM depending, if projects are nested in parent project or sibling projects.
	 */
	protected def String getParentSection() '''
		<parent>
			<groupId>«world.basePackage?.toLowerCase»</groupId>
			<artifactId>«world?.name?.toLowerCase»-parent</artifactId>
			<version>«world?.version»</version>
			«IF world?.architecture?.dirStrategy === namingStrategy.dirStrategy»
				<relativePath>../«world.name?.toLowerCase»-parent/</relativePath>
			«ENDIF»
		</parent>
	'''

}

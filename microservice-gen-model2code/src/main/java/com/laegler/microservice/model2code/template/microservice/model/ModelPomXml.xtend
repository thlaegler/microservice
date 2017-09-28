package com.laegler.microservice.model2code.template.microservice.model

import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import java.io.StringWriter
import java.util.Properties
import javax.inject.Inject
import javax.inject.Named
import org.apache.maven.model.Build
import org.apache.maven.model.Dependency
import org.apache.maven.model.Model
import org.apache.maven.model.Plugin
import org.apache.maven.model.PluginExecution
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import org.codehaus.plexus.util.xml.Xpp3Dom
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class ModelPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(ModelPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		LOG.debug('  Generate template {}/model/pom.yml', p.name)

		templateBuilder //
		.project(p) //
		.relativPath('/') //
		.documentation(docu).content(p.content).build
	}

	private def String getDocu() '''
		Persistence Model Module
	'''

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
			name = p.name
			description = docu
			properties = new Properties => [
				setProperty('spring.version', '4.3.8.RELEASE')
				setProperty('spring.boot.version', '1.5.6.RELEASE')
				setProperty('spring.data.version', '2.2.6.RELEASE')
				setProperty('springfox.version', '2.6.0')
				setProperty('hibernate.version', '5.2.10.Final')
				setProperty('hikari.version', '2.6.2')
				setProperty('mysql.version', '5.1.42')
				setProperty('couchbase.client.version', '2.2.6')
				setProperty('slf4j.version', '1.7.25')
				setProperty('lombok.version', '1.16.16')
			]
			dependencies = #[
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-web'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-data-jpa'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-data-elasticsearch'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-data-redis'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-data-couchbase'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'com.couchbase.client'
					artifactId = 'couchbase-spring-cache'
					version = '${couchbase.client.version}'
				],
				new Dependency => [
					groupId = 'mysql'
					artifactId = 'mysql-connector-java'
					version = '${mysql.version}'
					scope = 'runtime'
				],
				new Dependency => [
					groupId = 'io.springfox'
					artifactId = 'springfox-swagger2'
					version = '${springfox.version}'
				],
				new Dependency => [
					groupId = 'org.slf4j'
					artifactId = 'slf4j-api'
					version = '${slf4j.version}'
				],
				new Dependency => [
					groupId = 'org.projectlombok'
					artifactId = 'lombok'
					version = '${lombok.version}'
					optional = true
				]
			]
			build = new Build => [
				finalName = "${project.artifactId}"
				plugins = #[
					new Plugin => [
						groupId = 'org.apache.maven.plugins'
						artifactId = 'maven-clean-plugin'
						version = '3.0.0'
						configuration = new Xpp3Dom('filesets') => [
							addChild(new Xpp3Dom('fileset') => [
								addChild(new Xpp3Dom('directory') => [
									value = '${project.basedir}/src/gen/java/'
								])
							])
						]
					],
					new Plugin => [
						groupId = 'org.codehaus.mojo'
						artifactId = 'build-helper-maven-plugin'
						version = '3.0.0'
						executions = #[
							new PluginExecution => [
								configuration = new Xpp3Dom('sources') => [
									addChild(new Xpp3Dom('source') => [
										value = '${project.basedir}/src/gen/java/'
									])
								]
								phase = 'generate-sources'
								id = 'add-generated-sources'
								goals = #['add-source']
							]
						]
					]
				]
			]
		]
	}

}

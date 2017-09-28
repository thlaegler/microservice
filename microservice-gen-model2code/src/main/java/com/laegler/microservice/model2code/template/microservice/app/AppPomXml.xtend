package com.laegler.microservice.model2code.template.microservice.app

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
import com.laegler.microservice.adapter.util.NamingStrategy

@Named
class AppPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(AppPomXml)

	@Inject private extension NamingStrategy _name

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		LOG.debug('  Generating template /app/pom.xml')

		val contentWriter = new StringWriter
		mavenWriter.write(contentWriter, getModel(p))

		templateBuilder //
		.project(p) //
		.relativPath('/') //
		.documentation(docu).content(p.content).build
	}

	private def String getDocu() '''
		Spring Boot Application module
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
				setProperty('spring.cloud.version', 'Brixton.SR7')
				setProperty('springfox.version', '2.6.0')
				setProperty('slf4j.version', '1.7.25')
				setProperty('lombok.version', '1.16.16')
			]
			dependencies = #[
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.model'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.business'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.soap.server'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.rest.spec'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.grpc.server'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = '${project.groupId}'
					artifactId = p.name + '.websocket.server'
					version = '${project.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-web'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-starter-actuator'
					version = '${spring.boot.version}'
				],
				new Dependency => [
					groupId = 'org.springframework.boot'
					artifactId = 'spring-boot-dependencies'
					version = '${spring.boot.version}'
					type = 'pom'
					scope = 'import'
				],
				new Dependency => [
					groupId = 'org.springframework.cloud'
					artifactId = 'spring-cloud-dependencies'
					version = '${spring.cloud.version}'
					type = 'pom'
					scope = 'import'
				],
				new Dependency => [
					groupId = 'org.springframework.cloud'
					artifactId = 'spring-cloud-starter-config'
					version = '${spring.cloud.version}'
				],
				new Dependency => [
					groupId = 'io.springfox'
					artifactId = 'springfox-swagger2'
					version = '${springfox.version}'
				],
				new Dependency => [
					groupId = 'io.springfox'
					artifactId = 'springfox-swagger-ui'
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
					],
					new Plugin => [
						groupId = 'org.springframework.boot'
						artifactId = 'spring-boot-maven-plugin'
						version = '${spring.boot.version}'
						executions = #[
							new PluginExecution => [
								configuration = new Xpp3Dom('configuration') => [
									addChild(new Xpp3Dom('jvmArguments') => [
										value = '${org.example.spring.jvm.args}'
									])
									addChild(new Xpp3Dom('excludeDevtools') => [
										value = 'false'
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

package com.laegler.microservice.model2code.template.microservice.business

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
class BusinessPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(BusinessPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		LOG.debug('  Generate template {}/business/pom.yml', p.name)

		templateBuilder //
		.project(p) //
		.relativPath('/') //
		.documentation(docu).content(p.content).build
	}

	private def String getDocu() '''
		Business Logic Module
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

//				«parentSection»
//			<artifactId>«p.name»</artifactId>
//			<name>«p.canonicalName»</name>
//			<packaging>«p.packaging»</packaging>
//			<description>«p.documentation»</description>
//			<dependencies>
//				<!-- Project internal -->
//				<!-- <dependency>
//					<groupId>${project.groupId}</groupId>
//					<artifactId>«world.getOption('name')?.toLowerCase»-common</artifactId>
//					<version>${project.version}</version>
//				</dependency>
//				<dependency>
//					<groupId>${project.groupId}</groupId>
//					<artifactId>«world.getOption('name')?.toLowerCase»-model</artifactId>
//					<version>${project.version}</version>
//				</dependency>
//				<dependency>
//					<groupId>${project.groupId}</groupId>
//					<artifactId>«world.getOption('name')?.toLowerCase»-persistence</artifactId>
//					<version>${project.version}</version>
//				</dependency>
//				<dependency>
//					<groupId>org.wildfly.bom</groupId>
//					<artifactId>wildfly-javaee7-with-tools</artifactId>
//					<version>${wildfly.bom.version}</version>
//					<type>pom</type>
//				</dependency>
//				<dependency>
//					<groupId>javax.enterprise</groupId>
//					<artifactId>cdi-api</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>org.jboss.spec.javax.ejb</groupId>
//					<artifactId>jboss-ejb-api_3.2_spec</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>org.jboss.spec.javax.annotation</groupId>
//					<artifactId>jboss-annotations-api_1.2_spec</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>org.jboss.resteasy</groupId>
//					<artifactId>resteasy-jaxrs</artifactId>
//					<version>3.1.0.Beta1</version>
//				</dependency>
//				 -->
//				<dependency>
//					<groupId>io.rest-assured</groupId>
//					<artifactId>rest-assured</artifactId>
//					<version>3.0.0</version>
//				</dependency>
//				<dependency>
//					<groupId>org.eclipse.xtend</groupId>
//					<artifactId>org.eclipse.xtend.lib</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>org.slf4j</groupId>
//					<artifactId>slf4j-api</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>joda-time</groupId>
//					<artifactId>joda-time</artifactId>
//				</dependency>
//				<dependency>
//					<groupId>com.google.code.gson</groupId>
//					<artifactId>gson</artifactId>
//				</dependency>
//				
//				<!-- TEST -->
//				<dependency>
//					<groupId>junit</groupId>
//					<artifactId>junit</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>org.mockito</groupId>
//					<artifactId>mockito-all</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>org.powermock</groupId>
//					<artifactId>powermock-api-mockito</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>info.cukes</groupId>
//					<artifactId>cucumber-core</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>info.cukes</groupId>
//					<artifactId>cucumber-java</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>info.cukes</groupId>
//					<artifactId>cucumber-junit</artifactId>
//					<scope>test</scope>
//				</dependency>
//				<dependency>
//					<groupId>info.cukes</groupId>
//					<artifactId>gherkin</artifactId>
//					<scope>test</scope>
//				</dependency>
//			</dependencies>
//			<!-- <build>
//				<finalName>${project.artifactId}</finalName>
//				<plugins>
//					<plugin>
//						<groupId>org.apache.maven</groupId>
//						<artifactId>maven-war-plugin</artifactId>
//						<version>${war.plugin.version}</version>
//						<configuration>
//							<failOnMissingWebXml>false</failOnMissingWebXml>
//							<webXml>src/main/webapp/WEB-INF/web.xml</webXml>
//						</configuration>
//					</plugin>
//				</plugins>
//			</build> -->
}

package com.laegler.microservice.model2code.template.microservice.business

import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.model.FileType

@Named
class BusinessPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(BusinessPomXml)

	public def Template getTemplate(Project p) {
		LOG.debug('  Generate template {}/model/pom.yml', p.name)

		templateBuilder //
		.project(p) //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.content('''
			«parentSection»
			<artifactId>«p.name»</artifactId>
			<name>«p.canonicalName»</name>
			<packaging>«p.packaging»</packaging>
			<description>«p.documentation»</description>
			<dependencies>
				<!-- Project internal -->
				<!-- <dependency>
					<groupId>${project.groupId}</groupId>
					<artifactId>«world.getOption('name')?.toLowerCase»-common</artifactId>
					<version>${project.version}</version>
				</dependency>
				<dependency>
					<groupId>${project.groupId}</groupId>
					<artifactId>«world.getOption('name')?.toLowerCase»-model</artifactId>
					<version>${project.version}</version>
				</dependency>
				<dependency>
					<groupId>${project.groupId}</groupId>
					<artifactId>«world.getOption('name')?.toLowerCase»-persistence</artifactId>
					<version>${project.version}</version>
				</dependency>
				<dependency>
					<groupId>org.wildfly.bom</groupId>
					<artifactId>wildfly-javaee7-with-tools</artifactId>
					<version>${wildfly.bom.version}</version>
					<type>pom</type>
				</dependency>
				<dependency>
					<groupId>javax.enterprise</groupId>
					<artifactId>cdi-api</artifactId>
				</dependency>
				<dependency>
					<groupId>org.jboss.spec.javax.ejb</groupId>
					<artifactId>jboss-ejb-api_3.2_spec</artifactId>
				</dependency>
				<dependency>
					<groupId>org.jboss.spec.javax.annotation</groupId>
					<artifactId>jboss-annotations-api_1.2_spec</artifactId>
				</dependency>
				<dependency>
					<groupId>org.jboss.resteasy</groupId>
					<artifactId>resteasy-jaxrs</artifactId>
					<version>3.1.0.Beta1</version>
				</dependency>
				 -->
				<dependency>
					<groupId>io.rest-assured</groupId>
					<artifactId>rest-assured</artifactId>
					<version>3.0.0</version>
				</dependency>
				<dependency>
					<groupId>org.eclipse.xtend</groupId>
					<artifactId>org.eclipse.xtend.lib</artifactId>
				</dependency>
				<dependency>
					<groupId>org.slf4j</groupId>
					<artifactId>slf4j-api</artifactId>
				</dependency>
				<dependency>
					<groupId>joda-time</groupId>
					<artifactId>joda-time</artifactId>
				</dependency>
				<dependency>
					<groupId>com.google.code.gson</groupId>
					<artifactId>gson</artifactId>
				</dependency>
				
				<!-- TEST -->
				<dependency>
					<groupId>junit</groupId>
					<artifactId>junit</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>org.mockito</groupId>
					<artifactId>mockito-all</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>org.powermock</groupId>
					<artifactId>powermock-api-mockito</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>info.cukes</groupId>
					<artifactId>cucumber-core</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>info.cukes</groupId>
					<artifactId>cucumber-java</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>info.cukes</groupId>
					<artifactId>cucumber-junit</artifactId>
					<scope>test</scope>
				</dependency>
				<dependency>
					<groupId>info.cukes</groupId>
					<artifactId>gherkin</artifactId>
					<scope>test</scope>
				</dependency>
			</dependencies>
			<!-- <build>
				<finalName>${project.artifactId}</finalName>
				<plugins>
					<plugin>
						<groupId>org.apache.maven</groupId>
						<artifactId>maven-war-plugin</artifactId>
						<version>${war.plugin.version}</version>
						<configuration>
							<failOnMissingWebXml>false</failOnMissingWebXml>
							<webXml>src/main/webapp/WEB-INF/web.xml</webXml>
						</configuration>
					</plugin>
				</plugins>
			</build> -->
		''') //
		.build
	}
}

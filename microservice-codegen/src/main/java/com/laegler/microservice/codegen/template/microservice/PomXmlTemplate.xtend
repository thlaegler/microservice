package com.laegler.microservice.codegen.template.microservice

import com.laegler.microservice.codegen.template.utils.AbstractPomXmlTemplate
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.Microservice

/**
 * File Generator for Maven project object model (pom.xml) for model project.
 */
class PomXmlTemplate extends AbstractPomXmlTemplate {

	new(Microservice m) {
		super(m)
		documentation = '''«this.documentation» for model project'''

		content = template
	}

	new(Project project) {
		super(project)
		documentation = '''«this.documentation» for model project'''

		content = template
	}

	private def String getTemplate() '''
		«parentSection»
		<artifactId>«project?.name»</artifactId>
		<name>«project?.canonicalName»</name>
		<packaging>«project?.packaging»</packaging>
		<description>«project?.documentation»</description>
		<dependencies>
			<!-- Project internal -->
			<dependency>
				<groupId>${project.groupId}</groupId>
				<artifactId>«model?.getOption('name')?.toLowerCase»-common</artifactId>
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
				<groupId>mysql</groupId>
				<artifactId>mysql-connector-java</artifactId>
				<version>6.0.3</version>
			</dependency>
			<dependency>
				<groupId>org.hibernate.javax.persistence</groupId>
				<artifactId>hibernate-jpa-2.1-api</artifactId>
				<version>1.0.0.Final</version>
			</dependency>
			<dependency>
				<groupId>org.hibernate</groupId>
				<artifactId>hibernate-core</artifactId>
				<version>5.2.2.Final</version>
			</dependency>
			<dependency>
				<groupId>org.hibernate</groupId>
				<artifactId>hibernate-validator</artifactId>
				<version>5.2.2.Final</version>
			</dependency>
			<dependency>
				<groupId>org.hibernate.common</groupId>
				<artifactId>hibernate-commons-annotations</artifactId>
				<version>5.0.1.Final</version>
			</dependency>
			<dependency>
				<groupId>org.hibernate</groupId>
				<artifactId>hibernate-entitymanager</artifactId>
				<version>5.2.2.Final</version>
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
		<build>
			<finalName>${project.artifactId}</finalName>
			<plugins>
				<plugin>
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-ejb-plugin</artifactId>
					<version>${ejb.plugin.version}</version>
					<configuration>
					   	<ejbVersion>3.1</ejbVersion>
					</configuration>
				</plugin>
			</plugins>
		</build>
	'''

}

//package com.laegler.microservice.model2code.template.parent
//
//import com.laegler.microservice.model2code.template.base.AbstractPomXmlTemplate
//import com.laegler.microservice.model.Architecture
//
///**
// * File Generator for Maven project object model (pom.xml)
// */
//class ParentPomXmlTemplate {
//
//	val Architecture architecture
//
//	new(Architecture a) {
//		super(null)
//		architecture = a
//		documentation = 'Maven project object model (pom.xml)'
//
//		content = template
//	}
//
//	private def String getTemplate() '''
//		<artifactId>«project?.name»</artifactId>
//		<name>«project?.canonicalName»</name>
//		<packaging>«project?.packaging»</packaging>
//		<description>«project?.documentation»</description>
//		«modulesSection»
//		<dependencies>
//			<!-- Project internal -->
//			<dependency>
//				<groupId>${project.groupId}</groupId>
//				<artifactId>«model?.getOption('name')?.toLowerCase»-common</artifactId>
//				<version>${project.version}</version>
//			</dependency>
//			<dependency>
//				<groupId>${project.groupId}</groupId>
//				<artifactId>«model?.getOption('name')?.toLowerCase»-model</artifactId>
//				<version>${project.version}</version>
//			</dependency>
//			<dependency>
//				<groupId>${project.groupId}</groupId>
//				<artifactId>«model?.getOption('name')?.toLowerCase»-persistence</artifactId>
//				<version>${project.version}</version>
//			</dependency>
//			<dependency>
//				<groupId>org.wildfly.bom</groupId>
//				<artifactId>wildfly-javaee7-with-tools</artifactId>
//				<version>${wildfly.bom.version}</version>
//				<type>pom</type>
//			</dependency>
//			<dependency>
//				<groupId>javax.enterprise</groupId>
//				<artifactId>cdi-api</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>org.jboss.spec.javax.annotation</groupId>
//				<artifactId>jboss-annotations-api_1.2_spec</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>org.picketbox</groupId>
//				<artifactId>picketbox</artifactId>
//				<version>4.9.7.Final</version>
//			</dependency>
//			<dependency>
//				<groupId>org.jboss.spec.javax.faces</groupId>
//				<artifactId>jboss-jsf-api_2.2_spec</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>org.jboss.spec.javax.servlet</groupId>
//				<artifactId>jboss-servlet-api_3.1_spec</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>org.primefaces</groupId>
//				<artifactId>primefaces</artifactId>
//				<version>6.0</version>
//			</dependency>
//			<dependency>
//				<groupId>org.primefaces.extensions</groupId>
//				<artifactId>all-themes</artifactId>
//				<version>1.0.8</version>
//				<type>pom</type>
//			</dependency>
//			<dependency>
//				<groupId>commons-io</groupId>
//				<artifactId>commons-io</artifactId>
//				<version>2.4</version>
//			</dependency>
//			<dependency>
//				<groupId>commons-fileupload</groupId>
//				<artifactId>commons-fileupload</artifactId>
//				<version>1.3.1</version>
//			</dependency>
//			<dependency>
//				<groupId>org.tuckey</groupId>
//				<artifactId>urlrewritefilter</artifactId>
//				<version>${tuckey.version}</version>
//			</dependency>
//			<dependency>
//				<groupId>org.eclipse.xtend</groupId>
//				<artifactId>org.eclipse.xtend.lib</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>org.slf4j</groupId>
//				<artifactId>slf4j-api</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>joda-time</groupId>
//				<artifactId>joda-time</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>com.google.code.gson</groupId>
//				<artifactId>gson</artifactId>
//			</dependency>
//			<dependency>
//				<groupId>junit</groupId>
//				<artifactId>junit</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>org.mockito</groupId>
//				<artifactId>mockito-all</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>org.powermock</groupId>
//				<artifactId>powermock-api-mockito</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>info.cukes</groupId>
//				<artifactId>cucumber-core</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>info.cukes</groupId>
//				<artifactId>cucumber-java</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>info.cukes</groupId>
//				<artifactId>cucumber-junit</artifactId>
//				<scope>test</scope>
//			</dependency>
//			<dependency>
//				<groupId>info.cukes</groupId>
//				<artifactId>gherkin</artifactId>
//				<scope>test</scope>
//			</dependency>
//		</dependencies>
//		<build>
//			<finalName>${project.artifactId}</finalName>
//			<plugins>
//				<plugin>
//					<groupId>org.apache.maven</groupId>
//					<artifactId>maven-war-plugin</artifactId>
//					<version>${war.plugin.version}</version>
//					<configuration>
//						<failOnMissingWebXml>false</failOnMissingWebXml>
//						<webXml>src/main/webapp/WEB-INF/web.xml</webXml>
//					</configuration>
//				</plugin>
//			</plugins>
//		</build>
//	'''
//
//	/**
//	 * Parent section in POM depending, if projects are nested in parent project or sibling projects.
//	 */
//	protected def String getModulesSection() '''
//		<modules>
//			<module>«model.getOption('packageName')?.toLowerCase»</module>
//			<module>«model.getOption('name')?.toLowerCase»-parent</module>
//			<version>«project?.version»</version>
//		«««			«IF !model.getOption('structure')?.isNestedParent»
//				<relativePath>../«model.getOption('name')?.toLowerCase»-parent/</relativePath>
//		«««			«ENDIF»
//		</modules>
//	'''
//}

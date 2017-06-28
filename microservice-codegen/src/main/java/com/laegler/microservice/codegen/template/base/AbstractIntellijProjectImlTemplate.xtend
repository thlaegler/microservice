package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * File Generator for IntelliJ project file (project.iml)
 */
abstract class AbstractIntellijProjectImlTemplate extends AbstractTemplate {

	new(Project project) {
		super(project)
		fileType = FileType.INTELLIJ_PROJECT
		fileName = project.name
		relativPath = '/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<module org.jetbrains.idea.maven.project.MavenProjectsManager.isMavenModule="true" type="JAVA_MODULE" version="4">
		'''
		footer = '</module>'
		documentation = 'IntelliJ project file'

		content = template as String
	}

	override public getTemplateName() '''«this.class.name»'''

//	override public ProjectType getProject() { ProjectType.REST_CLIENT }
	def public getTemplate() '''
		«header»
			<component name="EclipseModuleManager">
				<conelement value="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER" />
				<src_description expected_position="2">
					<src_folder value="file://$MODULE_DIR$/src/main/java" expected_position="0" />
					<src_folder value="file://$MODULE_DIR$/src/test/java" expected_position="1" />
					<src_folder value="file://$MODULE_DIR$/src-gen/main/java" expected_position="2" />
					<src_folder value="file://$MODULE_DIR$/src/main/xtend-gen" expected_position="3" />
					<src_folder value="file://$MODULE_DIR$/src/main/resources" expected_position="4" />
				</src_description>
			</component>
			<component name="FacetManager">
				<facet type="web" name="Web">
					<configuration>
						<descriptors>
							<deploymentDescriptor name="jboss-web.xml" url="file://$MODULE_DIR$/src/main/webapp/WEB-INF/jboss-web.xml" />
							<deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/src/main/webapp/WEB-INF/web.xml" />
						</descriptors>
						<webroots>
							<root url="file://$MODULE_DIR$/src/main/webapp" relative="/" />
						</webroots>
						<sourceRoots>
							<root url="file://$MODULE_DIR$/src/main/java" />
							<root url="file://$MODULE_DIR$/src-gen/main/java" />
							<root url="file://$MODULE_DIR$/src/main/resources" />
							<root url="file://$MODULE_DIR$/src/main/xtend-gen" />
						</sourceRoots>
					</configuration>
				</facet>
			</component>
			<component name="NewModuleRootManager" LANGUAGE_LEVEL="JDK_1_7" inherit-compiler-output="false">
				<output url="file://$MODULE_DIR$/target/classes" />
				<output-test url="file://$MODULE_DIR$/target/test-classes" />
				<content url="file://$MODULE_DIR$">
					<sourceFolder url="file://$MODULE_DIR$/src/main/java" isTestSource="false" />
					<sourceFolder url="file://$MODULE_DIR$/src-gen/main/java" isTestSource="false" />
					<sourceFolder url="file://$MODULE_DIR$/src/main/xtend-gen" isTestSource="false" />
					<sourceFolder url="file://$MODULE_DIR$/src/main/resources" type="java-resource" />
					<sourceFolder url="file://$MODULE_DIR$/src/test/java" isTestSource="true" />
					<excludeFolder url="file://$MODULE_DIR$/target" />
				</content>
				<orderEntry type="library" name="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER" level="application" />
				<orderEntry type="inheritedJdk" />
				<orderEntry type="sourceFolder" forTests="false" />
			</component>
		«footer»
	'''

}

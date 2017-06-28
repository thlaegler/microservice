package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * File template for Eclipse classpath.
 */
class AbstractEclipseDotClasspathTemplate extends AbstractTemplate {

	new(Project project) {
		super(project)
		fileType = FileType.ECLIPSE_CLASSPATH
		fileName = ''
		relativPath = '/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<classpath>
		'''
		footer = '</classpath>'
		documentation = 'Eclipse classpath'
		skipStamping = true

		content = template
	}

	override public getTemplateName() '''«this.class.name»'''

	public def String getTemplate() '''
		<classpathentry kind="con" path="org.eclipse.xtend.XTEND_CONTAINER"/>
		<classpathentry kind="src" output="target/classes" path="src/main/java">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/classes" path="src-gen/main/java">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/classes" path="src/main/xtend-gen">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/test-classes" path="src/test/java">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/test-classes" path="src-gen/test/java">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/test-classes" path="src/test/xtend-gen">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/classes" path="src/main/resources" excluding="**">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="src" output="target/test-classes" path="src/test/resources" excluding="**">
			<attributes>
				<attribute name="optional" value="true"/>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
			<attributes>
				<attribute name="maven.pomderived" value="true"/>
				<attribute name="org.eclipse.jst.component.nondependency" value=""/>
			</attributes>
		</classpathentry>
		<classpathentry kind="con" path="org.eclipse.jst.server.core.container/rg.jboss.ide.eclrse.as.core.server.runtime.runtimeTarget/WildFly 10.x Runtime">
			<attributes>
				<attribute name="owner.project.facets" value="jst.jaxrs"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-«model.getOption('jvmVersion')»">
			<attributes>
				<attribute name="maven.pomderived" value="true"/>
			</attributes>
		</classpathentry>
		<classpathentry kind="output" path="target/classes"/>
	'''

}

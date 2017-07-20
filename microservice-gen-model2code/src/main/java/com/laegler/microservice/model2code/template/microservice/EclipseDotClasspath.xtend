package com.laegler.microservice.model2code.template.microservice

import javax.inject.Named
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.FileType
import javax.inject.Inject
import com.laegler.microservice.adapter.model.World
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.util.NamingStrategy

@Named
class EclipseDotClasspath {

	protected static final Logger LOG = LoggerFactory.getLogger(EclipseDotClasspath)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template EclipseDotClasspath')

		templateBuilder //
		.project(project) //
		.fileName('') //
		.fileType(FileType.ECLIPSE_CLASSPATH) //
		.relativPath('/') //
		.documentation('Eclipse classpath') //
		.skipStamping(true) //
		.header('''
			<?xml version="1.0" encoding="UTF-8"?>
			<classpath>
		''') //
		.footer('</classpath>') //
		.content('''
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
					«««					<attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib"/>
								<attribute nam		"org.eclipse.jst.component.nondependency" value=""/>
							</attributes>
						</classpathentry>
			
						<classpathentry kind="con" path="org.eclipse.jst.server.core.container/rg.jboss.ide.eclrse..nocore.server.runtime.runtimeTarget/WildFly 10.x Runtime">r			<attr.notes>
									<att.noute name="owner.project.facets" value="jst.jaxrs"/>
							</attributes>
						</classpathentry>
			
						<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8»">
			ace<attributes>
			ace	<attribute name="maven.pomderived" value="true"/>
			ace</attributes>
			ace</classpathentry>
			ace<classpathentry kind="output" path="target/classes"/>
		''').build
	}

}

package com.laegler.microservice.model2code.template.microservice.model

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.PomXml
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import java.io.StringWriter
import javax.inject.Inject
import javax.inject.Named
import org.apache.maven.model.Extension
import org.apache.maven.model.Build
import org.apache.maven.model.Dependency
import org.apache.maven.model.Model
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.apache.maven.model.Plugin
import java.util.HashMap
import org.codehaus.plexus.util.xml.Xpp3Dom

@Named
class ModelPomXml extends PomXml {

	protected static final Logger LOG = LoggerFactory.getLogger(ModelPomXml)

	@Inject MavenXpp3Writer mavenWriter

	public def Template getTemplate(Project p) {
		LOG.debug('  Generate template {}/model/pom.yml', p.name)

		Template::builder //
		.project(p) //
		.fileName('pom') //
		.fileType(FileType.XML) //
		.content(p.content).build
	}

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
			dependencies = #[
				new Dependency => [
					groupId = 'io.grpc'
					artifactId = 'grpc-all'
					version = '1.4.0'
				],
				new Dependency => [
					groupId = 'org.slf4j'
					artifactId = 'slf4j-api'
					version = '1.7.25'
				]
			]
			build= new Build => [
				finalName = "${project.artifactId}"
				extensions = #[
					new Extension => [
						groupId = 'kr.motd.maven'
						artifactId = 'os-maven-plugin'
						version = '${os-maven-plugin.version}'
					]
				]
				plugins = #[
                    new Plugin => [
						groupId = 'org.apache.maven.plugins'
						artifactId = 'maven-clean-plugin'
						version = '3.0.0'
						configuration = new Xpp3Dom('filesets') => [
							addChild(new Xpp3Dom('fileset') => [
								setAttribute('directory', '${grpc.dir.generated}')
							])
						]
					],
					new Plugin => [
						groupId = 'org.xolstice.maven.plugins'
						artifactId = 'protobuf-maven-plugin'
						version = '${os-maven-plugin.version}'
//					 <version>${protobuf-maven-plugin.version}</version>
//                    <configuration>
//                        <outputDirectory>${grpc.dir.generated}</outputDirectory>
//                        <clearOutputDirectory>false</clearOutputDirectory>
//                        <protocArtifact>com.google.protobuf:protoc:${google-protobuf.version}:exe:${os.detected.classifier}</protocArtifact>
//                        <pluginId>grpc-java</pluginId>
//                        <pluginArtifact>io.grpc:protoc-gen-grpc-java:${grpc.version}:exe:${os.detected.classifier}
//                        </pluginArtifact>
//                    </configuration>
//                    <executions>
//                        <execution>
//                            <goals>
//                                <goal>compile</goal>
//                                <goal>compile-custom</goal>
//                            </goals>
//                        </execution>
//                    </executions>
                    ]
				]
			]
		]
	}

}

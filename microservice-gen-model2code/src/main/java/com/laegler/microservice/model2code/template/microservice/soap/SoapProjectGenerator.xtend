package com.laegler.microservice.model2code.template.microservice.soap

import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import java.util.Arrays
import java.util.List
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Named
class SoapProjectGenerator extends Generator {

//<plugin>
//	<groupId>org.apache.cxf</groupId>
//	<artifactId>cxf-codegen-plugin</artifactId>
//	<version>${cxf.version}</version>
//	<executions>
//		<execution>
//			<id>generate-sources</id>
//			<phase>generate-sources</phase>
//			<configuration>
//				<sourceRoot>${project.build.directory}/generated/cxf</sourceRoot>
//				<wsdlOptions>
//					<wsdlOption>
//						<wsdl>${basedir}/src/main/resources/myService.wsdl</wsdl>
//					<extraargs>
//                   	 <extraarg>-impl</extraarg>
//                   	 <extraarg>-verbose</extraarg>
//               	 </extraargs>
//					</wsdlOption>
//				</wsdlOptions>
//			</configuration>
//			<goals>
//				<goal>wsdl2java</goal>
//			</goals>
//		</execution>
//	</executions>
//</plugin>
	protected static Logger LOG = LoggerFactory.getLogger(SoapProjectGenerator)

	def List<Project> generate(Architecture a, Artifact art) {
		LOG.debug('Generating SOAP project(s) for {}', a.name)

		Arrays.asList(a.generateSoapProject(art))
	}

	protected def Project generateSoapProject(Architecture a, Artifact art) {
		LOG.debug('Generating gRPC project')

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'soap')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'soap')) //
		.build => [ p |
			p.subProjects.addAll(
				a.generateSoapModelProject(art),
				a.generateSoapServerProject(art),
				a.generateSoapClientProject(art)
			)
//			p.templates?.addAll(
//				generateGrpcDefaultServerJava(p, a),
//				generateGrpcServerJava(p, a),
//				grpcModelPomXml.getTemplate(p)
//			)
		]
	}

	protected def Project generateSoapServerProject(Architecture a, Artifact art) {
		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'soap', 'server')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'soap', 'server')) //
		.build => [ p |
			p.templates.addAll(
				p.generateSoapDefaultServerJava(art),
				p.generateSoapServerJava(art)
			)
		]
	}

	protected def Project generateSoapClientProject(Architecture a, Artifact art) {
		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'soap', 'client')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'soap', 'client')) //
		.build => [ p |
			p.templates.addAll(
				p.generateSoapClientJava(art),
				p.generateSoapDefaultClientJava(art)
			)
		]
	}

	protected def Project generateSoapModelProject(Architecture a, Artifact art) {
		Project::builder //
		.name(namingStrategy.getProjectName(a.name, art.name, 'soap', 'model')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'soap', 'model')) //
		.build => [ p |
			p.templates.addAll(
				p.generateSoapModelPomXml(art),
				p.generateSoapClientJava(art),
				p.generateSoapDefaultClientJava(art)
			)
		]
	}

	protected def Template generateSoapModelPomXml(Project p, Artifact a) {
	}

	protected def Template generateParentPomXml(Project p, Artifact a) {
	}

	protected def Template generateSoapDefaultServerJava(Project p, Artifact a) {
	}

	protected def Template generateSoapServerJava(Project p, Artifact a) {
	}

	protected def Template generateSoapClientJava(Project p, Artifact a) {
		Template::builder //
		.fileName(a.name + 'SoapClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p)) //
		.content('''
			This is the template of SoapClient.java
		''').build
	}

	protected def Template generateSoapDefaultClientJava(Project project, Artifact s) {
	}

	protected def Template generateSoapClientPomXml(Project project, Artifact s) {
//		return new PomXmlTemplate(project)
	}

//	@Inject FileHelper fileHelper
//
////	@Inject GherkinAdapter 
//	private def void initProject() {
//		if (active) {
//			project = new Project(stubbr)
//			project.name = '''«stubbr?.stubb?.name?.toLowerCase»-faces'''
//			project.basePackage = '''«stubbr?.stubb?.packageName?.toLowerCase».faces'''
//			project.projectType = ProjectType.FACES
//			project.relativePath = '''/«project?.name»/'''
//			project.canonicalName = 'JSF/Faces project'
//			project.documentation = 'This project provides JSF/Faces UI layer'
//			log.info('''Generating Project: «project?.name»''')
//		}
//	}
//
//	/**
//	 * Generate persistence project	
//	 */
//	override public def prepare() {
//		initProject
//
//		project?.files?.addAll(#[
//			// General templates
//			new ReadmeMdTemplateBase(stubbr, project),
//			new IntellijProjectImlFileBase(stubbr, project),
//			new DotGitignoreTemplateBase(stubbr, project),
//			new EclipseDotClasspathTemplateBase(stubbr, project),
//			new EclipseDotProjectTemplateBase(stubbr, project),
//			new ManifestMfTemplateBase(stubbr, project),
//			new EjbJarXmlTemplateBase(stubbr, project),
//			new PersistenceXmlTemplateBase(stubbr, project),
//			// Eclipse templates
//			new EclipseCoreResourcesPrefsTemplateBase(stubbr, project),
//			new EclipseJdtCorePrefsTemplateBase(stubbr, project),
//			new EclipseM2eCorePrefsTemplateBase(stubbr, project),
//			new EclipseWstProjectFacetCorePrefsTemplateBase(stubbr, project),
//			new EclipseWstProjectFacetCoreXmlTemplateBase(stubbr, project),
//			// Project-specific singular templates
//			new PomXmlTemplate(stubbr, project),
//			new DotProjectTemplate(stubbr, project),
//			new ArtifactAppXtendTemplate(stubbr, project),
//			new ArtifactWebXmlXtendTemplate(stubbr, project),
//			new WebXmlTemplateBase(stubbr, project),
//			new FacesConfigXmlTemplateBase(stubbr, project),
//			new IndexDesktopXhtmlTemplate(stubbr, project),
//			new IndexMobileXhtmlTemplate(stubbr, project),
//			new IndexHtmlTemplate(stubbr, project),
//			new IndexXhtmlTemplate(stubbr, project)
//		])
//
//		// Entity-specific templates
//		stubbr?.stubb?.persistence?.entityModel?.entities?.forEach [ entity |
//			project?.files?.addAll(#[
//				new EntityPresenterXtendTemplate(stubbr, project, entity),
//				new EntityListDesktopXhtmlTemplate(stubbr, project, entity),
//				new EntityDetailsDesktopXhtmlTemplate(stubbr, project, entity),
//				new EntityListMobileXhtmlTemplate(stubbr, project, entity),
//				new EntityDetailsMobileXhtmlTemplate(stubbr, project, entity)
//			])
//		]
//
//		stubbr?.stubb?.presentation?.views?.forEach [ view |
//			project?.files?.addAll(#[
//				new ViewPresenterXtendTemplate(stubbr, project, view)
////				new ViewListDesktopXhtmlTemplate(stubbr, project, view),
////				new ViewDetailsDesktopXhtmlTemplate(stubbr, project, view),
////				new ViewListMobileXhtmlTemplate(stubbr, project, view),
////				new ViewDetailsMobileXhtmlTemplate(stubbr, project, view)
//			])
//		]
//
//		stubbr?.stubb?.behavior?.features?.forEach [ feature |
//			project?.files?.add(new BehaviorFeatureTemplate(stubbr, project, feature))
//			project?.files?.add(new BehaviorFeatureStepsXtendTemplate(stubbr, project, feature))
//		]
//
//		stubbr?.stubb?.behavior?.specifications?.forEach [ specification |
//			val GherkinDocument gherkinModel = gherkinAdapter.parse(specification)
//			val Feature feature = StubbrLangFactoryImpl.eINSTANCE.createFeature => [
//				name = gherkinModel?.feature?.name
//				label = gherkinModel?.feature?.description
//			]
//
//			project?.files?.add(new BehaviorFeatureTemplate(stubbr, project, feature) => [
//				content = fileHelper.getFileContent(fileHelper.findFile(specification))
//			])
//
//			project?.files?.add(new BehaviorFeatureStepsXtendTemplate(stubbr, project, feature) => [
//				content = gherkinAdapter.generate(project, specification)
//			])
//		]
//
//		project
//	}
//
//	private def boolean isActive() {
////		stubbr?.stubb?.presentation?.uiFramework == UiFramework.JSF
//		true
//	}
}

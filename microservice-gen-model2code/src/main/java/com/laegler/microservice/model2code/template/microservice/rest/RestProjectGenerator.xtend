package com.laegler.microservice.model2code.template.microservice.rest

import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import java.util.ArrayList
import java.util.List
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.generator.Generator
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.FileType
<<<<<<< Upstream, based on master
import java.util.Arrays
=======
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
>>>>>>> 63a4349 Cleaned Web Editor

class RestProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(RestProjectGenerator)

<<<<<<< Upstream, based on master
	def List<Project> generate(Architecture a, Artifact art) {
=======
	@Inject protected extension NamingStrategy _name

	override List<Project> generate(Architecture a) {
>>>>>>> 63a4349 Cleaned Web Editor
		LOG.debug('Generating REST project(s) for {}', a.name)

		Arrays.asList(a.generateRestProject(art))
	}

	protected def Project generateRestProject(Architecture a, Artifact art) {
		LOG.debug('Generating REST project(s) for {}', a.name)

		Project::builder //
<<<<<<< Upstream, based on master
		.name(namingStrategy.getProjectName(a.name, art.name, 'rest')) //
=======
		.name(a.name.getProjectName('rest')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.basePackage(world.basePackage) //
<<<<<<< Upstream, based on master
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'rest')) //
=======
		.directory(a.name.getProjectPath('rest')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.build => [ p |
			p.subProjects.addAll(
				a.generateRestParentProject(art),
				a.generateRestModelProject(art),
				a.generateRestServerProject(art),
				a.generateRestClientProject(art)
			)
//			p.templates?.addAll(
//				generateGrpcDefaultServerJava(p, a),
//				generateGrpcServerJava(p, a),
//				grpcModelPomXml.getTemplate(p)
//			)
		]
	}

	protected def Project generateRestParentProject(Architecture a, Artifact art) {
		LOG.debug('Generating REST parent project for {}', a.name)

		Project::builder //
<<<<<<< Upstream, based on master
		.name(namingStrategy.getProjectName(a.name, art.name, 'rest', 'parent')) //
=======
		.name(a.name.getProjectName('rest', 'parent')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.basePackage(world.basePackage) //
<<<<<<< Upstream, based on master
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'rest', 'parent')) //
=======
		.directory(a.name.getProjectPath('rest', 'parent')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.build => [p|
//			p.templates.addAll(
//				p.generateRestDefaultServerJava(a),
//				p.generateRestServerJava(a)
//			)
		]
	}

	protected def Project generateRestServerProject(Architecture a, Artifact art) {
		LOG.debug('Generating REST server project for {}', a.name)

		Project::builder //
<<<<<<< Upstream, based on master
		.name(namingStrategy.getProjectName(a.name, art.name, 'rest', 'server')) //
=======
		.name(a.name.getProjectName('rest', 'server')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.basePackage(world.basePackage) //
<<<<<<< Upstream, based on master
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'rest', 'server')) //
=======
		.directory(a.name.getProjectPath('rest', 'server')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.build => [ p |
			p.templates.addAll(
				p.generateRestDefaultServerJava(art),
				p.generateRestServerJava(art)
			)
		]
	}

	protected def Project generateRestClientProject(Architecture a, Artifact art) {
		LOG.debug('Generating REST client project for {}', a.name)

		Project::builder //
<<<<<<< Upstream, based on master
		.name(namingStrategy.getProjectName(a.name, art.name, 'rest', 'client')) //
=======
		.name(a.name.getProjectName('rest', 'client')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.basePackage(world.basePackage) //
<<<<<<< Upstream, based on master
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'rest', 'client')) //
=======
		.directory(a.name.getProjectPath('rest', 'client')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.build => [ p |
			p.templates.addAll(
				p.generateRestClientJava(art),
				p.generateRestDefaultClientJava(art)
			)
		]
	}

	protected def Project generateRestModelProject(Architecture a, Artifact art) {
		LOG.debug('Generating REST model project for {}', a.name)

		Project::builder //
<<<<<<< Upstream, based on master
		.name(namingStrategy.getProjectName(a.name, art.name, 'rest', 'model')) //
=======
		.name(a.name.getProjectName('rest', 'model')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.basePackage(world.basePackage) //
<<<<<<< Upstream, based on master
		.directory(namingStrategy.getProjectPath(a.name, art.name, 'rest', 'model')) //
=======
		.directory(a.name.getProjectPath('rest', 'model')) //
>>>>>>> 63a4349 Cleaned Web Editor
		.build => [ p |
			p.templates.addAll(
				p.generateRestDtoXtend(art)
			)
		]
	}

	protected def Template generateRestDtoXtend(Project p, Artifact s) {
		LOG.debug('Generating file: REST DTOs Xtend')
		// TODO
		null
	}

	protected def Template generateRestDefaultServerJava(Project p, Artifact s) {
		LOG.debug('Generating file: REST default server Java')
		// TODO
		null
	}

	protected def Template generateRestServerJava(Project p, Artifact s) {
		LOG.debug('Generating file: REST server Java')
		// TODO
		null
	}

	protected def Template generateRestClientJava(Project p, Artifact a) {
		LOG.debug('Creating file: REST client Java')

		Template::builder //
		.fileName(a.name.camelUp + 'RestClient') //
		.fileType(FileType.XTEND) //
		.relativPath(p.srcPathWithPackage) //
		.content('''
			package «p.basePackage»;
						
			import org.slf4j.Logger;
			import org.slf4j.LoggerFactory;
			
			@RestController
			public class «a.name.camelUp»RestClient {
			
				private static final Logger LOG = LoggerFactory.getLogger(«a.name.camelUp»RestClient.class);
			
			}
		''')
		.build
	}

	protected def Template generateRestDefaultClientJava(Project p, Artifact s) {
		LOG.debug('Creating file: REST default client Java')
		// TODO
		null
	}

	protected def Template generateRestClientPomXml(Project p, Artifact s) {
//		LOG.debug('Creating file: REST maven POM XML')
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

package com.laegler.microservice.model2code.generator

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

class RestProjectGenerator extends Generator {

	protected static Logger LOG = LoggerFactory.getLogger(RestProjectGenerator)

	List<Project> subProjects = new ArrayList
	List<Template> templates = new ArrayList

	override Project generate(Architecture a) {
		LOG.info('Generating REST project(s)')

		val project = projectBuilder.name(a.name).microserviceModel(a).build
		world.projects.add(project)

		a.artifacts.filter(Artifact).forEach [ s |
			s.name = s.name + '.grpc'
			world.projects.addAll(
				s.generateRestParentProject,
				s.generateRestClientProject,
				s.generateRestServerProject,
				s.generateRestModelProject
			)
		]

		project
	}

	protected def Project generateRestServerProject(Artifact s) {
		LOG.info('Generating REST server project')

		var Project it = projectBuilder.name(s.name + '.server').build
		templates.addAll(
			it.generateRestDefaultServerJava(s),
			it.generateRestServerJava(s)
		)
		it
	}

	protected def Project generateRestClientProject(Artifact s) {
		LOG.info('Generating REST client project')

		var Project it = projectBuilder.name(s.name + '.client').build
		templates.addAll(
			it.generateRestClientJava(s),
			it.generateRestDefaultClientJava(s)
		)

		it
	}

	protected def Project generateRestModelProject(Artifact s) {
		LOG.info('Generating REST model project')

		var Project it = projectBuilder.name(s.name + '.model').build
		it
	}

	protected def Project generateRestParentProject(Artifact s) {
		LOG.info('Generating REST parent project')

		var Project it = projectBuilder.name(s.name).build
		it
	}

	protected def Template generateRestDefaultServerJava(Project project, Artifact s) {
		LOG.info('Creating file: REST default server Java')
		// TODO
		null
	}

	protected def Template generateRestServerJava(Project project, Artifact s) {
		LOG.info('Creating file: REST server Java')
		// TODO
		null
	}

	protected def Template generateRestClientJava(Project project, Artifact s) {
		LOG.info('Creating file: REST client Java')

		templateBuilder.fileName('''«s.name»RestClient''').fileType(FileType.XTEND).
			relativPath('''src/main/gen/«s.name»''').content('''
				This is the template of RestClient.java
			''').build
	}

	protected def Template generateRestDefaultClientJava(Project project, Artifact s) {
		LOG.info('Creating file: REST default client Java')
		// TODO
		null
	}

	protected def Template generateRestClientPomXml(Project project, Artifact s) {
//		LOG.info('Creating file: REST maven POM XML')
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

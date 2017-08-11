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

	override List<Project> generate(Architecture a) {
		LOG.debug('Generating REST project(s) for {}', a.name)

		val List<Project> projects = new ArrayList
		a.artifacts?.filter(Artifact).forEach [ art |
			projects.add(art.generateRestProject)
		]
		projects
	}

	protected def Project generateRestProject(Artifact a) {
		LOG.debug('Generating REST project(s) for {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'rest')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'rest')) //
		.build => [ p |
			p.subProjects.addAll(
				a.generateRestParentProject,
				a.generateRestModelProject,
				a.generateRestServerProject,
				a.generateRestClientProject
			)
//			p.templates?.addAll(
//				generateGrpcDefaultServerJava(p, a),
//				generateGrpcServerJava(p, a),
//				grpcModelPomXml.getTemplate(p)
//			)
		]
	}

	protected def Project generateRestParentProject(Artifact a) {
		LOG.debug('Generating REST parent project for {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'rest', 'parent')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'rest', 'parent')) //
		.build => [p|
//			p.templates.addAll(
//				p.generateRestDefaultServerJava(a),
//				p.generateRestServerJava(a)
//			)
		]
	}

	protected def Project generateRestServerProject(Artifact a) {
		LOG.debug('Generating REST server project for {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'rest', 'server')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'rest', 'server')) //
		.build => [ p |
			p.templates.addAll(
				p.generateRestDefaultServerJava(a),
				p.generateRestServerJava(a)
			)
		]
	}

	protected def Project generateRestClientProject(Artifact a) {
		LOG.debug('Generating REST client project for {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'rest', 'client')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'rest', 'client')) //
		.build => [ p |
			p.templates.addAll(
				p.generateRestClientJava(a),
				p.generateRestDefaultClientJava(a)
			)
		]
	}

	protected def Project generateRestModelProject(Artifact a) {
		LOG.debug('Generating REST model project for {}', a.name)

		Project::builder //
		.name(namingStrategy.getProjectName(a.name, 'rest', 'model')) //
		.basePackage(world.basePackage) //
		.directory(namingStrategy.getProjectPath(a.name, 'rest', 'model')) //
		.build => [ p |
			p.templates.addAll(
				p.generateRestDtoXtend(a)
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

	protected def Template generateRestClientJava(Project p, Artifact s) {
		LOG.debug('Creating file: REST client Java')

		Template::builder //
		.fileName(s.name + 'RestClient') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getSrcPathWithPackage(p)) //
		.content('''
			This is the template of RestClient.java
		''').build
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

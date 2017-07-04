package com.laegler.microservice.codegen.generator

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.template.base.AbstractTemplate
import com.laegler.microservice.codegen.template.microservice.PomXmlTemplate
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.Spring
import java.util.ArrayList
import java.util.List

/**
 * Project Generator for JSF/Faces Project
 */
class GrpcProjectGenerator extends AbstractProjectGenerator {

	val List<Project> subProjects = new ArrayList
	var List<AbstractTemplate> templates = new ArrayList

	override Project generate(Architecture a) {
		project = projectBuilder.name(a.name).microserviceModel(a).build
		model.projects.add(project)

		a.artifacts.filter(Spring).forEach [ s |
			s.name = s.name + '.grpc'
			subProjects.addAll(
				s.generateGrpcParentProject,
				s.generateGrpcClientProject,
				s.generateGrpcServerProject,
				s.generateGrpcModelProject
			)
		]

		projectBuilder.name(a.name).microserviceModel(a)
//		
//		project.
//		subProjects.forEach[templates.forEach[it]]
		project
	}

	protected def Project generateGrpcServerProject(Spring s) {
		var Project it = projectBuilder.name(s.name + '.server').build
		templates.addAll(
			it.generateGrpcDefaultServerJava(s),
			it.generateGrpcServerJava(s)
		)
		it
	}

	protected def Project generateGrpcClientProject(Spring s) {
		var Project it = projectBuilder.name(s.name + '.client').build
		templates.addAll(
			it.generateGrpcClientJava(s),
			it.generateGrpcDefaultClientJava(s)
		)

		it
	}

	protected def Project generateGrpcModelProject(Spring s) {
		var Project it = projectBuilder.name(s.name + '.model').build
		it
	}

	protected def Project generateGrpcParentProject(Spring s) {
		var Project it = projectBuilder.name(s.name).build
		it
	}

	protected def AbstractTemplate generateGrpcDefaultServerJava(Project project, Spring s) {
	}

	protected def AbstractTemplate generateGrpcServerJava(Project project, Spring s) {
	}

	protected def AbstractTemplate generateGrpcClientJava(Project project, Spring s) {
		templateBuilder.fileName('''«s.name»GrpcClient''').fileType(FileType.XTEND).
			relativPath('''src/main/gen/«s.name»''').content('''
				This is the template of GrpcClient.java
			''').build
	}

	protected def AbstractTemplate generateGrpcDefaultClientJava(Project project, Spring s) {
	}

	protected def AbstractTemplate generateGrpcClientPomXml(Project project, Spring s) {
		return new PomXmlTemplate(project)
	}

	override prepare() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
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
//			new SpringAppXtendTemplate(stubbr, project),
//			new SpringWebXmlXtendTemplate(stubbr, project),
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

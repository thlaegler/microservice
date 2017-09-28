//package com.laegler.stubbr.lang.generator
//
//import com.laegler.stubbr.lang.genmodel.Project
//import com.laegler.stubbr.lang.genmodel.ProjectType
//import templates._common.EclipseDotProjectTemplateBase
//import templates._common.IntellijProjectImlFileBase
//import templates._common.ReadmeMdTemplateBase
//import templates._common.settings.EclipseCoreResourcesPrefsTemplateBase
//import templates.parent.PomXmlTemplate
//
///**
// * Project Generator for parent project
// */
//class ParentProjectGenerator extends AbstractProjectGenerator {
//
//	private def void initProject() {
//		if (active) {
//			project = new Project(stubbr)
//			project.name = '''«stubbr?.stubb?.name?.toLowerCase»-parent'''
//			project.basePackage = stubbr?.stubb?.packageName?.toLowerCase
//			project.projectType = ProjectType.PARENT
//			project.relativePath = '''/«IF !stubbr?.stubb?.structure.isIsNestedParent»«project.name»/«ENDIF»'''
//			project.canonicalName = 'Parent project'
//			project.documentation = 'This project keeps the deployable enterprise archive (EAR)'
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
//			new EclipseDotProjectTemplateBase(stubbr, project),
//			// Eclipse templates
//			new EclipseCoreResourcesPrefsTemplateBase(stubbr, project),
//			// Project-specific singular templates
//			new PomXmlTemplate(stubbr, project)
//		])
//
//		project
//	}
//
//	private def boolean isActive() {
////		stubbr?.stubb?.structure.isIsNestedParent
//		true
//	}
//
//}

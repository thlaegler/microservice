//package com.laegler.stubbr.lang.generator
//
//import com.laegler.stubbr.lang.adapter.SwaggerAdapter
//import com.laegler.stubbr.lang.genmodel.Project
//import com.laegler.stubbr.lang.genmodel.ProjectType
//import com.laegler.stubbr.lang.stubbrLang.RestLanguage
//import com.laegler.stubbr.lang.stubbrLang.RestWebservice
//import java.util.HashMap
//import java.util.Map
//import javax.inject.Inject
//import org.eclipse.xtend.lib.annotations.Accessors
//import templates._common.DotGitignoreTemplateBase
//import templates._common.EclipseDotClasspathTemplateBase
//import templates._common.EclipseDotProjectTemplateBase
//import templates._common.IntellijProjectImlFileBase
//import templates._common.ReadmeMdTemplateBase
//import templates._common.settings.EclipseCoreResourcesPrefsTemplateBase
//import templates._common.settings.EclipseJdtCorePrefsTemplateBase
//import templates._common.settings.EclipseM2eCorePrefsTemplateBase
//import templates._common.settings.EclipseWstProjectFacetCorePrefsTemplateBase
//import templates._common.settings.EclipseWstProjectFacetCoreXmlTemplateBase
//import templates._common.src_main_resource.meta_inf.ManifestMfTemplateBase
//import java.util.List
//import java.util.ArrayList
//
///**
// * Project generator for Swagger-based REST projects (multiple!)
// */
//class SwaggerProjectGenerator extends AbstractProjectGenerator {
//
//	@Inject SwaggerAdapter swaggerAdapter
//
//	@Accessors String clientOrServer
//
//	private def void initProject(RestWebservice webservice, RestLanguage language) {
//		if (active) {
//			project = new Project(stubbr)
//			if (language.getName().contains('CLIENT')) {
//				project.projectType = ProjectType.REST_CLIENT
//				clientOrServer = 'client'
//			} else {
//				project.projectType = ProjectType.REST_SERVER
//				clientOrServer = 'server'
//			}
//			project.name = '''«stubbr?.stubb?.name?.toLowerCase»-rest-«clientOrServer»-«language»'''
//			project.basePackage = '''«stubbr?.stubb?.packageName?.toLowerCase».rest.«clientOrServer».«language»'''
//			project.relativePath = '''/«project?.name»/'''
//			project.canonicalName = '''RESTful «clientOrServer» for language «language»'''
//			project.documentation = '''This project holds the RESTful «clientOrServer» for language «language»'''
//			log.info('''Generating Project: «project?.name»''')
//		}
//	}
//	
//	/**
//	 * Generate persistence project
//	 */
//	override public def prepare() {
//		throw new RuntimeException('Not implemented. Use prepare Multi instead')
//	}
//
//	public def List<Project> prepareMulti() {
//		val List<Project> projects = new ArrayList<Project>
//
//		// For each webservice definition
//		stubbr?.stubb?.webservice?.webservices?.forEach [ webservice |
//			if (webservice instanceof RestWebservice) {
//
//				// For each language definition
//				webservice?.languages?.forEach [ language |
//					initProject(webservice, language)
//					// Parse to Swagger model
//					// val Swagger swaggerModel = swaggerAdapter.parse(webservice.specification)
//					// Generate with Swagger Codegen
//					val Map<String, Object> params = new HashMap<String, Object> => [
//						put('language', language);
//						put('outputLocation', project.relativePath)
//					]
//					swaggerAdapter.generate(project, webservice.specification, params)
//
//					project?.files?.addAll(#[
//						// General templates
//						new ReadmeMdTemplateBase(stubbr, project),
//						new IntellijProjectImlFileBase(stubbr, project),
//						new DotGitignoreTemplateBase(stubbr, project),
//						new EclipseDotClasspathTemplateBase(stubbr, project),
//						new EclipseDotProjectTemplateBase(stubbr, project),
//						new ManifestMfTemplateBase(stubbr, project),
//						// Eclipse templates
//						new EclipseCoreResourcesPrefsTemplateBase(stubbr, project),
//						new EclipseJdtCorePrefsTemplateBase(stubbr, project),
//						new EclipseM2eCorePrefsTemplateBase(stubbr, project),
//						new EclipseWstProjectFacetCorePrefsTemplateBase(stubbr, project),
//						new EclipseWstProjectFacetCoreXmlTemplateBase(stubbr, project)
//					])
//					
//					projects.add(project)
//				]
//			}
//		]
//
//		projects
//	}
//
//	private def boolean isActive() {
////		!stubbr?.stubb?.webservice.nullOrEmpty2 && !stubbr?.stubb?.webservice?.webservices.nullOrEmpty2
//		true
//	}
//
//}

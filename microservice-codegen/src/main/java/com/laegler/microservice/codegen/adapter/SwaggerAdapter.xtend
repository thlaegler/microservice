package com.laegler.microservice.codegen.adapter

import io.swagger.codegen.DefaultGenerator
import io.swagger.codegen.config.CodegenConfigurator
import io.swagger.models.Swagger
import io.swagger.parser.SwaggerParser
import java.io.File
import java.util.HashMap
import java.util.Map
import java.util.logging.Logger
import javax.inject.Inject
import com.laegler.microservice.codegen.model.FileHelper
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.ModelWrapper
import com.laegler.microservice.codegen.model.ModelAccessor

/**
 * Helper for parsing Swagger YAML file.
 */
class SwaggerAdapter implements StubbrAdapter<Swagger> {

	protected val ModelWrapper model = ModelAccessor.model

	@Inject Logger log

	@Inject FileHelper fileHelper
	@Inject SwaggerParser parser
	@Inject CodegenConfigurator configurator
	@Inject DefaultGenerator generator

	/**
	 * Parse a Swagger YAML file to Swagger model
	 */
	public override Swagger parse(String fileLocation) {
		log.info('''Parsing Swagger YAML file.''')
		val File file = fileHelper.findFile(fileLocation)
		return parser.read(file.path)
	}
	
	public override String generate(Project project, String fileLocation) {
		generate(project, fileLocation, new HashMap)
	}

	/**
	 * Map of required Parameter:
	 * <ul>
	 * <li>'language': the Swagger language (type RestLanguage) that should be used.</li>
	 * <li>'outputLocation': the directory where swagger should generate artifacts.</li>
	 * </ul>
	 */
	public override String generate(Project project, String fileLocation, Map<String, Object> params) {
		if(params == null || !params.containsKey('language') || !params.containsKey('outputLocation')) {
			log.warning('Cannot generate Swagger filesbecause of missing parameters.')
			return null
		}
		val String language = model?.getOption('language')
//		params.get('language') as RestLanguage
		val String outputLocation = params.get('outputLocation') as String
		
//		log.info('''Generate Swagger files for «language».''')
		
		// Not needed anymore
		// val Swagger swaggerModel = parse(fileLocation)
		val File file = fileHelper.findFile(fileLocation)

		configurator.verbose = false

		configurator.inputSpec = file.absolutePath
		configurator.outputDir = '''«file.parent»/../«outputLocation»/'''
		configurator.skipOverwrite = false
		configurator.auth = 'oauth2'
//		configurator.lang = language.toClassname
		
		// configurator.library = ''
		configurator.apiPackage = '''«model?.getOption('packageName')».rest.«language».api'''
		configurator.modelPackage = '''«model?.getOption('packageName')».rest.«language».model'''
		configurator.invokerPackage = '''«model?.getOption('packageName')».rest.«language».invoker'''

//		configurator.groupId = model?.getOption('packageName')
//		configurator.artifactId = model?.getOption('name')
//		configurator.artifactVersion = model?.getOption('version')
		// configurator.modelNamePrefix = ''
		// configurator.modelNameSuffix = ''
		// configurator.templateDir = ''
		
		Thread.currentThread.contextClassLoader = ClassLoader.systemClassLoader
		val StringBuilder generatedFiles = new StringBuilder
		generator.opts(configurator.toClientOptInput).generate.forEach [ generatedFile |
			log.info('''Swagger Codegen generated file: «generatedFile.absolutePath»''')
			generatedFiles.append(generatedFile.absolutePath)
		]
		return generatedFiles.toString

//		try {
//			val ClientOptInput input = configurator.toClientOptInput
//			new DefaultGenerator().opts(input).generate();
//		} catch (Exception e) {
//			log.warning('Failed to generate Swagger from YAML')
//		}
	}
	
//	private def String toClassname(RestLanguage language) {
//		val String langPackage = 'io.swagger.codegen.languages'
//		switch (language) {
//			case ANDROID_CLIENT: return '''«langPackage».AndroidClientCodegen'''
//			case HTML2_CLIENT: return '''«langPackage».StaticHtml2Generator'''
//			case IOS_CLIENT: return '''«langPackage».JavaResteasyServerCodegen'''
//			case JAVA_CLIENT: return '''«langPackage».JavaClientCodegen'''
//			case JAXRS_SERVER: return '''«langPackage».JavaJAXRSSpecServerCodegen'''
//			case PHP_CLIENT: return '''«langPackage».PhpClientCodegen'''
//			case PHP_SERVER: return '''«langPackage».LumenServerCodegen'''
//			case RESTEASY_SERVER: return '''«langPackage».JavaResteasyServerCodegen'''
//			default: {
//				log.warning('''Unknown language: «language.literal»''')
//				return '''«langPackage».UndefinedSwaggerCodegen'''
//			}
//		}
//	}

}

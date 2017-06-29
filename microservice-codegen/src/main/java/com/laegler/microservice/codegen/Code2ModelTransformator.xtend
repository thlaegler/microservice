package com.laegler.microservice.codegen

import com.laegler.microservice.codegen.generator.DocuProjectGenerator
import com.laegler.microservice.codegen.generator.GrpcProjectGenerator
import com.laegler.microservice.codegen.generator.RestProjectGenerator
import com.laegler.microservice.codegen.generator.SoapProjectGenerator
import com.laegler.microservice.codegen.model.FileHelper
import microserviceModel.MicroserviceModelFactory
import microserviceModel.impl.MicroserviceModelFactoryImpl
import org.apache.maven.project.MavenProject
import com.laegler.microservice.codegen.model.Project
import java.util.List
import org.apache.maven.model.Model
import java.util.ArrayList
import microserviceModel.Artifact
import com.laegler.microservice.codegen.template.base.BaseTemplate
import com.laegler.microservice.codegen.model.FileType
import java.nio.file.Files
import java.nio.file.Path
import java.io.File
import java.util.stream.Stream
import java.nio.file.Paths
import java.util.stream.Collectors
import org.eclipse.emf.ecore.EObject
import microserviceModel.Architecture
import java.util.Set
import java.util.Map
import java.util.HashMap

class Code2ModelTransformator extends AbstractTransformator {

	extension FileHelper fileHelper

	extension MicroserviceModelFactory microserviceModelFactory = new MicroserviceModelFactoryImpl

	val soapProject = new SoapProjectGenerator
	val restProject = new RestProjectGenerator
	val grpcProject = new GrpcProjectGenerator
	val docuProject = new DocuProjectGenerator

	public def void generate(MavenProject mavenProject) {
		mavenProject?.generate(mavenProject?.artifactId, mavenProject?.groupId)
	}

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		model.mavenProject = mavenProject

		val List<Artifact> artifacts = new ArrayList => [
			mavenProject?.model.transformMavenDependencies(basePackage)
			mavenProject?.model.transformPom
			mavenProject.transformFileStructure(basePackage)

			mavenProject?.transformSpring
		]

		val parentProject = Project.builder.name(name).basePackage(basePackage).microserviceModel(
			createArchitecture => [
				artifacts.addAll(artifacts)
			]
		)

		BaseTemplate.builder.fileName(name + '-microservice').relativPath('/').fileType(FileType.ARCHITECTURE).
			content('''
				architecture: «name» {
					«FOR Artifact a : artifacts»
						service: «a.name»
					«ENDFOR»
				}
			''').build?.toFile

		model.projects?.forEach [
			templates?.forEach[toFile]
		]
	}

	protected def void transformPom(Model pom) {
		LOG.info('''Trying to transform POM to Model: «pom.artifactId»''')
		pom?.modules?.forEach [
			model.projects?.add(
				Project.builder.name(pom.artifactId).microserviceModel(model as EObject).build
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «model.projects?.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«model.projects?.join(', ')»''')
	}

	protected def void transformSpring(MavenProject it) {
		it?.compileClasspathElements
		LOG.info('''Trying to find and transform Spring from Class and Annotation level to Model: «it.artifactId»''')
		LOG.info('''	basedir: «it.basedir»''')
		LOG.info('''	projects: «it.collectedProjects.join(', ')»''')
		LOG.info('''	classpathElements:«it.compileClasspathElements.join(', ')»''')
		LOG.info('''	compileSourceRoots: «it.compileSourceRoots.join(', ')»''')
		it?.collectedProjects?.forEach [cP |
//			cP.
//			model.projects?.add(
//				Project.builder.name(cP.artifactId).microserviceModel(model as EObject).build
//			)
		]
//		 TODO
//		val Architecture architecture = resolveApiReader().read(getValidClasses(RestController.class));
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «model.projects?.size» Spring Projects in classpath(s) of «it.artifactId»''')
		LOG.info('''	«model.projects?.join(', ')»''')

	}

	private def Architecture read(Set<Class<?>> classes) {
//		throws GenerateException {
		// relate all methods to one base request mapping if multiple controllers exist for that mapping
		// get all methods from each controller & find their request mapping
		// create map - resource string (after first slash) as key, new SpringResource as value
		val Architecture architecture = createArchitecture
		val Map<String, SpringResource> resourceMap = getResourceMap(classes);
		for (String str : resourceMap.keySet()) {
			val SpringResource resource = resourceMap.get(str);
			read(resource, architecture);
		}

		architecture
	}

	/**
	 * see ClassSwaggerReader
	 */
	private def Architecture read(SpringResource resource, Architecture architecture) {
//		val List<Method> methods = resource.getMethods();
//		val Map<String, Tag> tags = new HashMap<String, Tag>();
//
//		val List<SecurityRequirement> resourceSecurities = new ArrayList<SecurityRequirement>();
//
//		// Add the description from the controller api
//		val Class<?> controller = resource.getControllerClass();
//		val RequestMapping controllerRM = AnnotatedElementUtils.findMergedAnnotation(controller, RequestMapping.class);
//
//		val String[] controllerProduces = new String[0];
//		val String[] controllerConsumes = new String[0];
//		if (controllerRM != null) {
//			controllerConsumes = controllerRM.consumes();
//			controllerProduces = controllerRM.produces();
//		}
//
//		if (controller.isAnnotationPresent(Api.class)) {
//			val Api api = AnnotatedElementUtils.findMergedAnnotation(controller, Api.class);
//			if (!canReadApi(false, api)) {
//				return swagger;
//			}
//			tags = updateTagsForApi(null, api);
//			resourceSecurities = getSecurityRequirements(api);
//		}
//
//		resourcePath = resource.getControllerMapping();
//
//		// collect api from method with @RequestMapping
//		val Map<String, List<Method>> apiMethodMap = collectApisByRequestMapping(methods);
//
//		for (String path : apiMethodMap.keySet()) {
//			for (Method method : apiMethodMap.get(path)) {
//				val RequestMapping requestMapping = SpringUtils.getMethodRequestMapping(method);
//				if (requestMapping == null) {
//					continue;
//				}
//				val ApiOperation apiOperation = AnnotatedElementUtils.findMergedAnnotation(method, ApiOperation.class);
//				if (apiOperation == null || apiOperation.hidden()) {
//					continue;
//				}
//
//				val Map<String, String> regexMap = new HashMap<String, String>();
//				val String operationPath = parseOperationPath(path, regexMap);
//
//				// http method
//				for (RequestMethod requestMethod : requestMapping.method()) {
//                    val String httpMethod = requestMethod.toString().toLowerCase();
//                    val Operation operation = parseMethod(method);
//
//                    updateOperationParameters(new ArrayList<Parameter>, regexMap, operation);
//
//                    updateOperationProtocols(apiOperation, operation);
//
//                    val String[] apiProduces = requestMapping.produces();
//                    val String[] apiConsumes = requestMapping.consumes();
//
//                    apiProduces = if(apiProduces.length == 0) { controllerProduces }else{ apiProduces}
//                    apiConsumes = (apiConsumes.length == 0) { controllerConsumes }else
//				{
//					apiConsumes
//				}
//
//				apiConsumes = updateOperationConsumes(new String[0], apiConsumes, operation);
//				apiProduces = updateOperationProduces(new String[0], apiProduces, operation);
//
//				updateTagsForOperation(operation, apiOperation);
//				updateOperation(apiConsumes, apiProduces, tags, resourceSecurities, operation);
//				updatePath(operationPath, httpMethod, operation);
//			}
//		}
//		swagger
		null
	}

	private def List<Artifact> transformMavenDependencies(Model pom, String basePackage) {
		val List<Artifact> artifacts = new ArrayList
		
		LOG.info('''Trying to transform POM child-modules to Model: «pom.artifactId»''')
		pom?.modules?.forEach [mo|
			model.projects?.add(
				Project.builder.name(pom.artifactId).microserviceModel(model as EObject).build
			)
			artifacts.add(
				createArtifact => [
					name = mo
				]
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «model.projects?.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«model.projects?.join(', ')»''')


		LOG.info('''Trying to transform POM dependencies to Model: «pom.artifactId»''')
		pom?.dependencies?.forEach [dep|
			model.projects?.add(
				Project.builder.name(pom.artifactId).microserviceModel(model as EObject).build
			)
			artifacts.add(
				createArtifact => [
					name = dep.artifactId
				]
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «model.projects?.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«model.projects?.join(', ')»''')
		
		artifacts
	}

	private def List<Artifact> transformFileStructure(MavenProject mavenProject, String basePackage) {
		val List<Artifact> artifacts = new ArrayList
		val parentPath = mavenProject.basedir.toPath
		
		LOG.info('''Trying to transform file structure to Model: «mavenProject.artifactId»''')
		if (Files.isDirectory(parentPath)) {
			Files.walk(parentPath).collect(Collectors.toList()).filter[Files.isDirectory(it)].forEach [ f |
				artifacts.add(createArtifact => [
					name = f.fileName.toString
				])
			]
		}
		LOG.info('File structure to Model Transformation done.')
		LOG.info('''Found «artifacts?.size» projects in file structure «mavenProject.artifactId»''')
		LOG.info('''	«artifacts?.join(', ')»''')
		
		artifacts
	}

}

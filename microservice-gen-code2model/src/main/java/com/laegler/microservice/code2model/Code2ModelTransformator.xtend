package com.laegler.microservice.code2model

import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.model.microserviceModel.Architecture
import com.laegler.microservice.model.microserviceModel.Artifact
import java.nio.file.Files
import java.util.ArrayList
import java.util.List
import java.util.Set
import java.util.stream.Collectors
import javax.inject.Named
import org.apache.maven.model.Model
import org.apache.maven.project.MavenProject
import org.eclipse.emf.ecore.EObject

@Named
class Code2ModelTransformator extends AbstractTransformator {

	public def void generate(MavenProject mavenProject) {
		mavenProject?.generate(mavenProject?.artifactId, mavenProject?.groupId)
	}

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		world.mavenProject = mavenProject

		val List<Artifact> artifacts = new ArrayList => [
			mavenProject?.model.transformMavenDependencies(basePackage)
			mavenProject?.model.transformPom
			mavenProject.transformFileStructure(basePackage)

			mavenProject?.transformSpring
		]

		val parentProject = projectBuilder.name(name).basePackage(basePackage).microserviceModel(
			microserviceModelFactory.createArchitecture => [
				artifacts.addAll(artifacts)
			]
		)

		fileHelper.toFile(new TemplateBuilder() //
		.fileName(name + '-microservice') //
		.relativPath('/') //
		.fileType(FileType.ARCHITECTURE).content('''
			architecture: «name» {
				«FOR Artifact a : artifacts»
					service: «a.name»
				«ENDFOR»
			}
		''') //
		.build)

		world.projects?.forEach [
			templates?.forEach[fileHelper.toFile(it)]
		]
	}

	protected def void transformPom(Model pom) {
		LOG.info('''Trying to transform POM to Model: «pom.artifactId»''')
		pom?.modules?.forEach [
			world.projects?.add(
				projectBuilder.name(pom.artifactId).microserviceModel(world as EObject).build
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «world.projects.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«world.projects?.join(', ')»''')
	}

	protected def void transformSpring(MavenProject mavenProject) {
		mavenProject?.compileClasspathElements
		LOG.
			info('''Trying to find and transform Spring from Class and Annotation level to Model: «mavenProject.artifactId»''')
		LOG.info('''	basedir: «mavenProject.basedir»''')
		LOG.info('''	projects: «mavenProject.collectedProjects.join(', ')»''')
		LOG.info('''	classpathElements:«mavenProject.compileClasspathElements.join(', ')»''')
		LOG.info('''	compileSourceRoots: «mavenProject.compileSourceRoots.join(', ')»''')
		mavenProject?.collectedProjects?.forEach [cP |
//			cP.
//			model.projects?.add(
//				projectBuilder.name(cP.artifactId).microserviceModel(model as EObject).build
//			)
		]
//		 TODO
//		val Architecture architecture = resolveApiReader().read(getValidClasses(RestController.class));
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «world.projects.size» Spring Projects in classpath(s) of «mavenProject.artifactId»''')
		LOG.info('''	«world.projects?.join(', ')»''')
	}

	private def Architecture read(Set<Class<?>> classes) {
//		throws GenerateException {
		// relate all methods to one base request mapping if multiple controllers exist for that mapping
		// get all methods from each controller & find their request mapping
		// create map - resource string (after first slash) as key, new SpringResource as value
		val Architecture architecture = microserviceModelFactory.createArchitecture
//		val Map<String, SpringResource> resourceMap = getResourceMap(classes);
//		for (String str : resourceMap.keySet()) {
//			val SpringResource resource = resourceMap.get(str);
//			read(resource, architecture);
//		}
		architecture
	}

//	/**
//	 * see ClassSwaggerReader
//	 */
//	private def Architecture read(SpringResource resource, Architecture architecture) {
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
//		null
//	}
	private def List<Artifact> transformMavenDependencies(Model pom, String basePackage) {
		val List<Artifact> artifacts = new ArrayList

		LOG.info('''Trying to transform POM child-modules to Model: «pom.artifactId»''')
		pom?.modules?.forEach [ mo |
			world.projects?.add(
				projectBuilder.name(pom.artifactId).microserviceModel(world as EObject).build
			)
			artifacts.add(
				microserviceModelFactory.createArtifact => [
					name = mo
				]
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «world.projects.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«world.projects.join(', ')»''')

		LOG.info('''Trying to transform POM dependencies to Model: «pom.artifactId»''')
		pom?.dependencies?.forEach [ dep |
			world.projects?.add(
				projectBuilder.name(pom.artifactId).microserviceModel(world as EObject).build
			)
			artifacts.add(
				microserviceModelFactory.createArtifact => [
					name = dep.artifactId
				]
			)
		]
		LOG.info('POM to Model Transformation done.')
		LOG.info('''Found «world.projects.size» projects in Model «pom.artifactId»''')
		LOG.info('''	«world.projects.join(', ')»''')

		artifacts
	}

	private def List<Artifact> transformFileStructure(MavenProject mavenProject, String basePackage) {
		val List<Artifact> artifacts = new ArrayList
		val parentPath = mavenProject.basedir.toPath

		LOG.info('''Trying to transform file structure to Model: «mavenProject.artifactId»''')
		if (Files.isDirectory(parentPath)) {
			Files.walk(parentPath).collect(Collectors.toList()).filter[Files.isDirectory(it)].forEach [ f |
				artifacts.add(microserviceModelFactory.createArtifact => [
					name = f.fileName.toString
				])
			]
		}
		LOG.info('File structure to Model Transformation done.')
		LOG.info('''Found «artifacts.size» projects in file structure «mavenProject.artifactId»''')
		LOG.info('''	«artifacts.join(', ')»''')

		artifacts
	}

}

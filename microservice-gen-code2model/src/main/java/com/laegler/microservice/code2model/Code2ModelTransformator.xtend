package com.laegler.microservice.code2model

import com.laegler.microservice.adapter.AbstractTransformator
import com.laegler.microservice.adapter.exception.GeneratorException
import com.laegler.microservice.code2model.generator.ArchitectureYamlProjectGenerator
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import java.nio.file.Files
import java.util.ArrayList
import java.util.List
import java.util.stream.Collectors
import javax.inject.Inject
import javax.inject.Named
import org.apache.maven.model.Model
import org.apache.maven.project.MavenProject
import com.laegler.microservice.adapter.model.Project

@Named
class Code2ModelTransformator extends AbstractTransformator {

	@Inject ArchitectureYamlProjectGenerator architectureYamlProject

	public def void generate(MavenProject mavenProject) {
		mavenProject?.generate(mavenProject?.artifactId, mavenProject?.groupId)
	}

	public def void generate(MavenProject mavenProject, String name, String basePackage) {
		LOG.debug('------------')
		LOG.debug(' Code2Model ')
		LOG.debug('------------')
		LOG.debug('Generating {}', basePackage + '.' + name, mavenProject?.toString)
		LOG.debug('')

		if (mavenProject === null) {
			throw new GeneratorException('Maven model is null.')
		}

		world => [ w |
			w.name = name
			w.basePackage = basePackage
//			w.mavenProject = mavenProject
//			w.rootFolder = mavenProject?.basedir

			// TODO: get values from maven properties
			w.author = 'johnDoe'
			w.vendor = 'myCompanyName'
			w.vendorPrefix = 'it'

			w.architecture = new Architecture => [ a |
				mavenProject?.model?.transformPom
				mavenProject?.transformSpring
				a.artifacts.addAll(mavenProject?.model?.transformMavenDependencies(basePackage))
				a.artifacts.addAll(mavenProject?.transformFileStructure(basePackage))
			]

			w.rootProject.subProjects.addAll(
				architectureYamlProject.generate(w.architecture)
			)

			w.rootProject.subProjects.forEach [ p |
				p.templates.forEach [ t |
					fileHelper.toFile(t)
				]
			]
		]

		LOG.debug('Successfully finished code to model')
		LOG.debug('')
	}

	protected def void transformPom(Model pom) {
		LOG.debug('''Trying to transform POM to Model: «pom.artifactId»''')
		pom?.modules?.forEach [
			world.rootProject.subProjects?.add(
				Project::builder //
				.name(pom.artifactId) //
				.microserviceModel(world) //
				.build
			)
		]
		LOG.debug('POM to Model Transformation done.')
		LOG.debug('''Found «world.rootProject.subProjects.size» projects in Model «pom.artifactId»''')
		LOG.debug('''	«world.rootProject.subProjects?.join(', ')»''')
	}

	protected def void transformSpring(MavenProject mavenProject) {
		mavenProject?.compileClasspathElements
		LOG.
			info('''Trying to find and transform Spring from Class and Annotation level to Model: «mavenProject.artifactId»''')
		LOG.debug('''	basedir: «mavenProject.basedir»''')
		LOG.debug('''	projects: «mavenProject.collectedProjects.join(', ')»''')
		LOG.debug('''	classpathElements:«mavenProject.compileClasspathElements.join(', ')»''')
		LOG.debug('''	compileSourceRoots: «mavenProject.compileSourceRoots.join(', ')»''')
		mavenProject?.collectedProjects?.forEach [cP |
//			cP.
//			model.projects?.add(
//				projectBuilder.name(cP.artifactId).microserviceModel(model as EObject).build
//			)
		]
//		 TODO
//		val Architecture architecture = resolveApiReader().read(getValidClasses(RestController.class));
		LOG.debug('POM to Model Transformation done.')
		LOG.
			debug('''Found «world.rootProject.subProjects.size» Spring Projects in classpath(s) of «mavenProject.artifactId»''')
		LOG.debug('''	«world.rootProject.subProjects?.join(', ')»''')
	}

//	private def Architecture read(Set<Class<?>> classes) {
//		throws GenerateException {
//		val Architecture architecture = new Architecture
//		val Map<String, SpringResource> resourceMap = getResourceMap(classes);
//		for (String str : resourceMap.keySet()) {
//			val SpringResource resource = resourceMap.get(str);
//			read(resource, architecture);
//		}
//		architecture
//	}
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

		LOG.debug('''Trying to transform POM child-modules to Model: «pom.artifactId»''')
		pom?.modules?.forEach [ mo |
			world.rootProject.subProjects?.add(
				Project::builder //
				.name(pom.artifactId) //
				.microserviceModel(world) //
				.build
			)
			artifacts.add(
				new Artifact => [
					name = mo
				]
			)
		]
		LOG.debug('POM to Model Transformation done.')
		LOG.debug('''Found «world.rootProject.subProjects.size» projects in Model «pom.artifactId»''')
		LOG.debug('''	«world.rootProject.subProjects.join(', ')»''')

		LOG.debug('''Trying to transform POM dependencies to Model: «pom.artifactId»''')
		pom?.dependencies?.forEach [ dep |
			world.rootProject.subProjects?.add(
				Project::builder //
				.name(pom.artifactId) //
				.microserviceModel(world) //
				.build
			)
			artifacts.add(
				new Artifact => [
					name = dep.artifactId
				]
			)
		]
		LOG.debug('POM to Model Transformation done.')
		LOG.debug('''Found «world.rootProject.subProjects.size» projects in Model «pom.artifactId»''')
		LOG.debug('''	«world.rootProject.subProjects.join(', ')»''')

		artifacts
	}

	private def List<Artifact> transformFileStructure(MavenProject mavenProject, String basePackage) {
		val List<Artifact> artifacts = new ArrayList
		val parentPath = mavenProject.basedir.toPath

		LOG.debug('''Trying to transform file structure to Model: «mavenProject.artifactId»''')
		if (Files.isDirectory(parentPath)) {
			Files.walk(parentPath).collect(Collectors.toList()).filter[Files.isDirectory(it)].forEach [ f |
				artifacts.add(new Artifact => [
					name = f.fileName.toString
				])
			]
		}
		LOG.debug('File structure to Model Transformation done.')
		LOG.debug('''Found «artifacts.size» projects in file structure «mavenProject.artifactId»''')
		LOG.debug('''	«artifacts.join(', ')»''')

		artifacts
	}

}

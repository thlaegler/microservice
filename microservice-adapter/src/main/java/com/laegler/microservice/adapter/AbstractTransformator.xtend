package com.laegler.microservice.adapter

import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.FileUtil
import com.laegler.microservice.adapter.util.YamlConfig
import com.laegler.microservice.model.Artifact
import java.io.File
import java.io.FileInputStream
import java.io.FileNotFoundException
import java.io.FileReader
import java.io.InputStream
import java.lang.annotation.Annotation
import java.util.LinkedHashSet
import java.util.List
import java.util.Set
import javax.inject.Inject
import org.apache.maven.model.Dependency
import org.apache.maven.model.Model
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.yaml.snakeyaml.Yaml
import org.yaml.snakeyaml.constructor.Constructor

abstract class AbstractTransformator {

	protected static Logger LOG = LoggerFactory.getLogger(AbstractTransformator)

	@Inject protected World world
	@Inject protected FileUtil fileHelper
	@Inject protected MavenXpp3Reader mavenReader

//	protected def Set<Class<?>> getValidClasses(String basePackage, Class<? extends Annotation> clazz) {
//		val Set<Class<?>> classes = new LinkedHashSet<Class<?>>
//		val Set<Class<?>> c = new Reflections(basePackage).getTypesAnnotatedWith(clazz, true);
//		classes.addAll(c)
//		val Set<Class<?>> inherited = new Reflections(basePackage).getTypesAnnotatedWith(clazz);
//		classes.addAll(inherited)
//		classes
//	}

//	protected def Map<String, SpringResource> getResourceMap(Set<Class<?>> validClasses) {
//	 throws GenerateException {
//		val Map<String, SpringResource> resourceMap = new HashMap<String, SpringResource>
//	for (Class<?> aClass : validClasses) {
//		val RequestMapping requestMapping = AnnotationUtils.findAnnotation(aClass, RequestMapping.class);
//		// This try/catch block is to stop a bamboo build from failing due to NoClassDefFoundError
//		// This occurs when a class or method loaded by reflections contains a type that has no dependency
//		try {
//			resourceMap = analyzeController(aClass, resourceMap, "");
//			val List<Method> mList = new ArrayList<Method>(Arrays.asList(aClass.getMethods()));
//			if (aClass.getSuperclass() != null) {
//				mList.addAll(Arrays.asList(aClass.getSuperclass().getMethods()));
//			}
//		} catch (NoClassDefFoundError e) {
//			LOG.error(e.getMessage());
//			LOG.debug(aClass.getName());
//		// exception occurs when a method type or annotation is not recognized by the plugin
//		}
//	}
//		resourceMap
//	}

	protected def void transform(File rootDir) {
//		world.rootFolder = rootDir
		rootDir?.listFiles?.filter [
			it?.listFiles !== null
		].forEach[transform(it, it.name)]
	}

	protected def void transform(File projectDir, String projectName) {
		var File pomXmlFile = projectDir?.listFiles?.findFirst [
			it.name.equals('pom.xml')
		]
		val Model pom = mavenReader.read(new FileReader(pomXmlFile))

//			if (!model.artifactId?.equals(pomXmlFile?.name)) {}
		if (pom !== null) {
			world.rootProject.subProjects?.add(
				Project::builder//
				.name(pom?.artifactId)//
				.pom(pom)//
				.build
			)
		}
//		writeFile(model.projects.dotGraphFileContent2, projectDir.getFilePath('architecture.component.plantuml'))
		world.rootProject.subProjects?.transform
	}

	protected def void transform(List<Project> projects) {
		projects?.forEach[transform]
	}

	protected def void transform(Project m) {
//		writeFile(m.subsetFileContent, m.getFilePath('''«m.name»-subset.txt'''))
//		writeFile(m.kubeFileContent, m.getFilePath('''«m.name»-kube.yml'''))
	}

	protected def String getSubsetContent(Artifact spring) '''
		«spring?.name»
		«FOR consume : spring?.consumes»
			«consume.endpoint»
		«ENDFOR»
	'''

	protected def String getSubsetFileContent(Project m) '''
		«FOR Dependency d : m.pom.dependencies»
			«IF d.groupId==m.pom.groupId»
				«d.artifactId»
			«ENDIF»
		«ENDFOR»
	'''

	protected def String getKubeFileContent(Project m) '''
		pod: «m.name»
	'''

	protected def String getSpringApplicationFileContent(Project m) {
//		m.directory.listFiles.filter[it?.listFiles?.c]
		val Constructor constructor = new Constructor(YamlConfig);
		val Yaml yaml = new Yaml(constructor);

		var InputStream input = null;
		try {
			input = new FileInputStream(new File('/tmp/apps.yml'))
		} catch (FileNotFoundException e) {
			e.printStackTrace
		}
		val YamlConfig data = yaml.loadAs(input, YamlConfig)
		if (data !== null) {
			data.toString
		}
	}

	protected def String getFormatted(String description) {
		if (description.nullOrEmpty) {
			return ''
		} else {
			return ''' («description»)'''
		}
	}

	protected def String getClean(String identifier) {
		return identifier?.replaceAll('[^a-zA-Z0-9]', '')
	}

	protected def String getFilePath(File path, String filename) '''«path»«File.separator»«filename»'''

	protected def String getFilePath(Project m, String filename) '''«m.directory»«File.separator»«filename»'''

//	private def Map<String, SpringResource> analyzeController(Class<?> controllerClazz,
//		Map<String, SpringResource> resourceMap, String description) {
//		val String[] controllerRequestMappingValues = SpringUtils.getControllerRequestMapping(controllerClazz);
//
//		// Iterate over all value attributes of the class-level RequestMapping annotation
//		for (String controllerRequestMappingValue : controllerRequestMappingValues) {
//			for (Method method : controllerClazz.getMethods()) {
//				val RequestMapping methodRequestMapping = SpringUtils.getMethodRequestMapping(method);
//
//				// Look for method-level @RequestMapping annotation
//				if (methodRequestMapping != null) {
//					val RequestMethod[] requestMappingRequestMethods = methodRequestMapping.method();
//
//					// For each method-level @RequestMapping annotation, iterate over HTTP Verb
//					for (RequestMethod requestMappingRequestMethod : requestMappingRequestMethods) {
//						val String[] methodRequestMappingValues = methodRequestMapping.value();
//
//						// Check for cases where method-level @RequestMapping#value is not set, and use the controllers @RequestMapping
//						if (methodRequestMappingValues.length == 0) {
//							// The map key is a concat of the following:
//							// 1. The controller package
//							// 2. The controller class name
//							// 3. The controller-level @RequestMapping#value
//							val String resourceKey = controllerClazz.getCanonicalName() +
//								controllerRequestMappingValue + requestMappingRequestMethod;
//							if (!resourceMap.containsKey(resourceKey)) {
//								resourceMap.put(resourceKey,
//									new SpringResource(controllerClazz, controllerRequestMappingValue, resourceKey,
//										description));
//							}
//							resourceMap.get(resourceKey).addMethod(method);
//						} else {
//							// Here we know that method-level @RequestMapping#value is populated, so
//							// iterate over all the @RequestMapping#value attributes, and add them to the resource map.
//							for (String methodRequestMappingValue : methodRequestMappingValues) {
//								val String resourceKey = controllerClazz.getCanonicalName() +
//									controllerRequestMappingValue + methodRequestMappingValue +
//									requestMappingRequestMethod;
//									if (!methodRequestMappingValue.isEmpty()) {
//										if (!resourceMap.containsKey(resourceKey)) {
//											resourceMap.put(resourceKey,
//												new SpringResource(controllerClazz, methodRequestMappingValue,
//													resourceKey, description));
//										}
//										resourceMap.get(resourceKey).addMethod(method);
//									}
//								}
//							}
//						}
//					}
//				}
//			}
//			controllerClazz.getFields();
//			controllerClazz.getDeclaredFields(); // <--In case developer declares a field without an associated getter/setter.
//			// this will allow NoClassDefFoundError to be caught before it triggers bamboo failure.
//			return resourceMap;
//	}
}

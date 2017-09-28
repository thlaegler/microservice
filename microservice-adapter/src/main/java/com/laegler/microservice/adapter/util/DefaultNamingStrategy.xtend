package com.laegler.microservice.adapter.util

import com.laegler.microservice.adapter.model.Project
import java.util.ArrayList
import java.util.List
import java.util.regex.Pattern
import javax.enterprise.inject.Default
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Default
class DefaultNamingStrategy implements NamingStrategy {

	private static final Logger LOG = LoggerFactory.getLogger(DefaultNamingStrategy)

	public static final String DIR = '/'
	public static final String PRJ = '.'
	public static final String PKG = '.'
	public static final String DSH = '-'
	public static final String USC = '_'

	override getSrcPathWithPackage(Project p) {
		val path = srcPath + DIR + getPackagePath(p)
		LOG.trace('getSrcPathWithPackage({}) returns: {}', p, path)
		path
	}

	override getSrcGenPathWithPackage(Project p) {
		val path = srcGenPath + DIR + getPackagePath(p)
		LOG.trace('getSrcGenPathWithPackage({}) returns: {}', p, path)
		path
	}

	override getSrcPath() {
		val path = 'src' + DIR + 'main' + DIR + 'java'
		LOG.trace('getSrcPath() returns: {}', path)
		path
	}

	override getSrcGenPath() {
		val path = 'src' + DIR + 'main' + DIR + 'gen'
		LOG.trace('getSrcGenPath() returns: {}', path)
		path
	}

	override getSrcTestPath() {
		val path = 'src' + DIR + 'test' + DIR + 'java'
		LOG.trace('getSrcTestPath() returns: {}', path)
		path
	}

	override getResPath() {
		val path = 'src' + DIR + 'main' + DIR + 'resources'
		LOG.trace('getResPath() returns: {}', path)
		path
	}

	override getResTestPath() {
		val path = 'src' + DIR + 'test' + DIR + 'resources'
		LOG.trace('getResTestPath() returns: {}', path)
		path
	}

	override getPackagePath(Project p) {
		var path = p.basePackage?.split(Pattern.quote(PKG))?.join(DIR).toLowerCase
		path = path + DIR + getProjectPath(p.name)
		LOG.trace('getPackagePath({}) returns: {}', p, path)
		path
	}

	override getProjectName(String... parts) {
		val path = parts.join(PRJ)
		LOG.trace('getProjectName({}) returns: {}', parts, path)
		path
	}

	override getProjectPath(String name) {
//		val seperator = Arrays.asList(DIR, PRJ, PKG, DSH, USC)
		val List<String> parts = new ArrayList
		name //
		.split(Pattern.quote(DIR)).forEach [
			split(Pattern.quote(PRJ)).forEach [
				split(Pattern.quote(PKG)).forEach [
					split(Pattern.quote(DSH)).forEach [
						split(Pattern.quote(USC)).forEach [ pa |
							parts.add(pa)
						]
					]
				]
			]
		]
		val path = parts.join(DIR).toLowerCase
		LOG.trace('getProjectPath({}) returns: {}', name, path)
		path
	}

	override getProjectPath(String... parts) {
		val path = parts.join(DIR).toLowerCase
		LOG.trace('getProjectPath({}) returns: {}', parts, path)
		path
	}

	override getAbsoluteSourcePath(String name) {
		val path = name.projectPath + relativeSourcePath
		LOG.trace('getAbsoluteSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteGeneratedSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedSourcePath
		LOG.trace('getAbsoluteGeneratedSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteTestSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedTestSourcePath
		LOG.trace('getAbsoluteTestSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteGeneratedTestSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedTestSourcePath
		LOG.trace('getAbsoluteGeneratedTestSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteBasePackagePath(String name) {
		val path = name.projectPath + name.relativeBasePackagePath
		LOG.trace('getAbsoluteBasePackagePath({}) returns: {}', name, path)
		path
	}

	@Deprecated
	override getAbsoluteBasePackagePath(Project p) {
		val path = getProjectPath(p.name) + getRelativeBasePackagePath(p.basePackage)
		LOG.trace('getAbsoluteBasePackagePath({}) returns: {}', p, path)
		path
	}

	@Deprecated
	override getRelativeSourcePath() '''«DIR»src«DIR»main«DIR»java'''

	@Deprecated
	override getRelativeGeneratedSourcePath() '''«DIR»src«DIR»main«DIR»gen'''

	@Deprecated
	override getRelativeTestSourcePath() '''«DIR»src«DIR»test«DIR»java'''

	@Deprecated
	override getRelativeGeneratedTestSourcePath() {
		val path = DIR + 'src' + DIR + 'test' + DIR + 'gen'
		LOG.trace('getRelativeGeneratedTestSourcePath() returns: {}', path)
		path
	}

	@Deprecated
	override getRelativeBasePackagePath(String basePackage) {
		val path = DIR + basePackage?.split(Pattern.quote(PKG))?.join(DIR).toLowerCase
		LOG.trace('getRelativeBasePackagePath({}) returns: {}', basePackage, path)
		path
	}

	override getDirStrategy() '''deep'''

	override getPath() {
		getPath(null, '')
	}

	override getPath(Project p) {
		getPath(p, '')
	}

	override getPath(Project p, String subDir) {
		getPath(p, subDir, false)
	}

	override getPath(Project p, String subDir, boolean isResource) {
		getPath(p, subDir, false, false)
	}

	override getPath(Project p, String subDir, boolean isResource, boolean isGenerated) {
		getPath(p, subDir, false, false, false)
	}

	override getPath(Project p, String subDir, boolean isResource, boolean isGenerated, boolean isTest) {
		var StringBuilder path = new StringBuilder
//		path.append(p.name.projectPath)
		if (isResource) {
			path.append('src/main/resources')
		} else {
			path.append(srcPath)
		}
		if (isGenerated) {
			path.append('src/main/resources')
		}
		path.append(srcGenPath)
		if (isTest)
			(path.append(srcTestPath)
		)
		path.toString
//		getAbsoluteGeneratedSourcePath(p.name) + getRelativeBasePackagePath(p.name)
	}

	override getCamelUp(String name) {
		getCamelUp(name, false)
	}

	override getCamelLow(String name) {
		getCamelLow(name, false)
	}
	
	override getCamelUp(String name, boolean isPlural) {
		if (isPlural) {
			return name.toFirstUpper.plural
		}
		return name.toFirstUpper.replaceAll(' ', '')
	}

	override getCamelLow(String name, boolean isPlural) {
		if (isPlural) {
			return name.toFirstLower.plural
		}
		return name.toFirstLower.replaceAll(' ', '')
	}

	private def String getPlural(String name) {
		var String pluralName = name
		if (name.endsWith('y')) {
			pluralName = pluralName.substring(0, pluralName.length - 2) + 'ie'
		}
		return pluralName + 's'
	}

}

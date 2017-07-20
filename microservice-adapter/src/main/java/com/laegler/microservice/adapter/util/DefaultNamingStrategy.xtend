package com.laegler.microservice.adapter.util

import com.laegler.microservice.adapter.model.Project
import java.util.ArrayList
import java.util.List
import java.util.regex.Pattern
import javax.inject.Inject
import org.slf4j.Logger

class DefaultNamingStrategy implements NamingStrategy {

	@Inject Logger log

	public static final String DIR = '/'
	public static final String PRJ = '.'
	public static final String PKG = '.'
	public static final String DSH = '-'
	public static final String USC = '_'

	override getSrcPathWithPackage(Project p) {
		val path = srcPath + DIR + getPackagePath(p)
		log.trace('getSrcPathWithPackage({}) returns: {}', p, path)
		path
	}

	override getSrcGenPathWithPackage(Project p) {
		val path = srcGenPath + DIR + getPackagePath(p)
		log.trace('getSrcGenPathWithPackage({}) returns: {}', p, path)
		path
	}

	override getSrcPath() {
		val path = 'src' + DIR + 'main' + DIR + 'java'
		log.trace('getSrcPath() returns: {}', path)
		path
	}

	override getSrcGenPath() {
		val path = 'src' + DIR + 'main' + DIR + 'gen'
		log.trace('getSrcGenPath() returns: {}', path)
		path
	}

	override getSrcTestPath() {
		val path = 'src' + DIR + 'test' + DIR + 'java'
		log.trace('getSrcTestPath() returns: {}', path)
		path
	}

	override getResPath() {
		val path = 'src' + DIR + 'main' + DIR + 'resources'
		log.trace('getResPath() returns: {}', path)
		path
	}

	override getResTestPath() {
		val path = 'src' + DIR + 'test' + DIR + 'resources'
		log.trace('getResTestPath() returns: {}', path)
		path
	}

	override getPackagePath(Project p) {
		var path = p.basePackage?.split(Pattern.quote(PKG))?.join(DIR).toLowerCase
		path = path + DIR + getProjectPath(p.name)
		log.trace('getPackagePath({}) returns: {}', p, path)
		path
	}

	override getProjectName(String... parts) {
		val path = parts.join(PRJ)
		log.trace('getProjectName({}) returns: {}', parts, path)
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
		log.trace('getProjectPath({}) returns: {}', name, path)
		path
	}

	override getProjectPath(String... parts) {
		val path = parts.join(DIR).toLowerCase
		log.trace('getProjectPath({}) returns: {}', parts, path)
		path
	}

	override getAbsoluteSourcePath(String name) {
		val path = name.projectPath + relativeSourcePath
		log.trace('getAbsoluteSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteGeneratedSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedSourcePath
		log.trace('getAbsoluteGeneratedSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteTestSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedTestSourcePath
		log.trace('getAbsoluteTestSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteGeneratedTestSourcePath(String name) {
		val path = name.projectPath + relativeGeneratedTestSourcePath
		log.trace('getAbsoluteGeneratedTestSourcePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteBasePackagePath(String name) {
		val path = name.projectPath + name.relativeBasePackagePath
		log.trace('getAbsoluteBasePackagePath({}) returns: {}', name, path)
		path
	}

	override getAbsoluteBasePackagePath(Project p) {
		val path = getProjectPath(p.name) + getRelativeBasePackagePath(p.basePackage)
		log.trace('getAbsoluteBasePackagePath({}) returns: {}', p, path)
		path
	}

	override getRelativeSourcePath() '''«DIR»src«DIR»main«DIR»java'''

	override getRelativeGeneratedSourcePath() '''«DIR»src«DIR»main«DIR»gen'''

	override getRelativeTestSourcePath() '''«DIR»src«DIR»test«DIR»java'''

	override getRelativeGeneratedTestSourcePath() {
		val path = DIR + 'src' + DIR + 'test' + DIR + 'gen'
		log.trace('getRelativeGeneratedTestSourcePath() returns: {}', path)
		path
	}

	override getRelativeBasePackagePath(String basePackage) {
		val path = DIR + basePackage?.split(Pattern.quote(PKG))?.join(DIR).toLowerCase
		log.trace('getRelativeBasePackagePath({}) returns: {}', basePackage, path)
		path
	}

	override getDirStrategy() '''deep'''

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
//		var StringBuilder path = new StringBuilder
//		path.append('src')
//		if(isResource) {path.append('src/main/resources')}
		getAbsoluteGeneratedSourcePath(p.name) + getRelativeBasePackagePath(p.name)
	}

}

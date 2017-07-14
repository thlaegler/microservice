package com.laegler.microservice.adapter.util

import java.util.Arrays

class DefaultNamingStrategy implements NamingStrategy {

	public static final String DIR = '/'
	public static final String PRJ = '-'
	public static final String PKG = '.'

	override getProjectName(String name, String... parts) {
		val stringBuilder = new StringBuilder
		stringBuilder.append(name)
		parts.forEach [
			stringBuilder.append(PRJ)
			stringBuilder.append(it)
		]
		stringBuilder.toString
	}

	override getAbsoluteBasePath(String name, String... parts) {
		name.absoluteBasePath + parts.join(DIR)
	}

	override getAbsoluteBasePath(String name) {
		val seperator = Arrays.asList('.', '-', '_')

		val stringBuilder = new StringBuilder
		seperator.forEach [ sep |
			name.split(sep).forEach [ part |
				stringBuilder.append(DIR).append(part)
			]
		]
		stringBuilder.toString
	}

	override getAbsoluteSourcePath(String name) { name.absoluteBasePath + relativeSourcePath }

	override getAbsoluteGeneratedSourcePath(String name) {
		name.absoluteBasePath + relativeGeneratedSourcePath
	}

	override getAbsoluteTestSourcePath(String name) { name.absoluteBasePath + relativeGeneratedSourcePath }

	override getAbsoluteGeneratedTestSourcePath(String name) {
		name.absoluteBasePath + relativeGeneratedTestSourcePath
	}

	override getAbsoluteBasePackagePath(String name) { name.absoluteBasePath + name.relativeBasePackagePath }

	override getRelativeSourcePath() '''src«DIR»main«DIR»java'''

	override getRelativeGeneratedSourcePath() '''src«DIR»main«DIR»gen'''

	override getRelativeTestSourcePath() '''src«DIR»test«DIR»java'''

	override getRelativeGeneratedTestSourcePath() '''src«DIR»test«DIR»gen'''

	override getRelativeBasePackagePath(String basePackage) { DIR + basePackage.split('.').join(DIR) }

	override getDirStrategy() '''deep'''

}

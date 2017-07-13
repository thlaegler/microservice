package com.laegler.microservice.adapter.util

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

	override getProjectDir(String name, String... parts) {
		val stringBuilder = new StringBuilder
		stringBuilder.append(name)
		parts.forEach [
			stringBuilder.append(DIR).append(name).append(DIR).append(it)
		]
		stringBuilder.toString
	}

	override getBasePath() { DIR }

	override getSourcePath() '''src«DIR»main«DIR»java'''

	override getGeneratedSourcePath() '''src«DIR»main«DIR»gen'''

	override getTestSourcePath() '''src«DIR»test«DIR»java'''

	override getGeneratedTestSourcePath() '''src«DIR»test«DIR»gen'''

}

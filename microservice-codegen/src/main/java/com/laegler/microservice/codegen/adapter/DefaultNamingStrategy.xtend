package com.laegler.microservice.codegen.adapter

class DefaultNamingStrategy implements NamingStrategy {
		
	override getProjectName(String name, String... parts) {
		val stringBuilder = new StringBuilder
		stringBuilder.append(name)
		parts.forEach[
			stringBuilder.append('.')
			stringBuilder.append(it)
		]
		stringBuilder.toString
	}
	
	override getProjectDir(String name, String... parts) {
		val stringBuilder = new StringBuilder
		stringBuilder.append(name)
		parts.forEach[
			stringBuilder.append('/')
			stringBuilder.append(name)
			stringBuilder.append('.')
			stringBuilder.append(it)
		]
		stringBuilder.toString
	}
	
	override getSourcePath() '''src/main/java'''
	
	override getGeneratedSourcePath() '''src/main/gen'''
	
	override getTestSourcePath() '''src/test/java'''
	
	override getGeneratedTestSourcePath() '''src/test/gen'''

	
}
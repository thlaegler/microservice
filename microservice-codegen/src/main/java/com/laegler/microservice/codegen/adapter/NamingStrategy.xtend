package com.laegler.microservice.codegen.adapter

interface NamingStrategy {

	def String getProjectName(String name, String... parts)
	
	def String getProjectDir(String name, String... parts)
		
	def String getSourcePath()

	def String getGeneratedSourcePath()

	def String getTestSourcePath()

	def String getGeneratedTestSourcePath()

}

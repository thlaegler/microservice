package com.laegler.microservice.adapter.util

import javax.inject.Named

@Named
interface NamingStrategy {

	def String getProjectName(String name, String... parts)

	def String getProjectDir(String name, String... parts)

	def String getBasePath()

	def String getSourcePath()

	def String getGeneratedSourcePath()

	def String getTestSourcePath()

	def String getGeneratedTestSourcePath()

}

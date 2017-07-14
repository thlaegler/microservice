package com.laegler.microservice.adapter.util

import javax.inject.Named

@Named
interface NamingStrategy {

	def String getProjectName(String name, String... parts)

	def String getAbsoluteBasePath(String name, String... parts)

	def String getAbsoluteBasePath(String name)

	def String getAbsoluteSourcePath(String name)

	def String getAbsoluteGeneratedSourcePath(String name)

	def String getAbsoluteTestSourcePath(String name)

	def String getAbsoluteGeneratedTestSourcePath(String name)

	def String getAbsoluteBasePackagePath(String name)

	def String getRelativeSourcePath()

	def String getRelativeGeneratedSourcePath()

	def String getRelativeTestSourcePath()

	def String getRelativeGeneratedTestSourcePath()

	def String getRelativeBasePackagePath(String name)

	def String getDirStrategy()

}

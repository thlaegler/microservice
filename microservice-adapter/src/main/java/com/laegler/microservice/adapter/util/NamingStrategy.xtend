package com.laegler.microservice.adapter.util

import javax.inject.Named
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.model.Entity

@Named
interface NamingStrategy {

	def String getSrcPathWithPackage(Project p)

	def String getSrcGenPathWithPackage(Project p)

	def String getSrcPath()

	def String getSrcGenPath()

	def String getSrcTestPath()

	def String getResPath()

	def String getResTestPath()

	def String getPackagePath(Project p)

	def String getProjectName(String... parts)

	def String getProjectPath(String name)

	def String getProjectPath(String... parts)

	def String getAbsoluteSourcePath(String name)

	def String getAbsoluteGeneratedSourcePath(String name)

	def String getAbsoluteTestSourcePath(String name)

	def String getAbsoluteGeneratedTestSourcePath(String name)

	def String getAbsoluteBasePackagePath(String name)

	def String getAbsoluteBasePackagePath(Project project)

	def String getRelativeSourcePath()

	def String getRelativeGeneratedSourcePath()

	def String getRelativeTestSourcePath()

	def String getRelativeGeneratedTestSourcePath()

	def String getRelativeBasePackagePath(String name)

	def String getDirStrategy()

	def String getPath();

	def String getPath(Project p);

	def String getPath(Project project, String subDir)

	def String getPath(Project project, String subDir, boolean isResource)

	def String getPath(Project project, String subDir, boolean isResource, boolean isGenerated)

	def String getPath(Project project, String subDir, boolean isResource, boolean isGenerated, boolean isTest)
	
	def String getCamelUp(String name)
	
	def String getCamelLow(String name)
	
	def String getCamelUp(String name, boolean isPlural)
	
	def String getCamelLow(String name, boolean isPlural)
	
}

package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.OverwritePolicy
import com.laegler.microservice.codegen.model.Project
import java.util.HashMap
import java.util.UUID
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

class TemplateBuilder {

	UUID id
	String fileName
	FileType fileType
	String relativPath
	Project project

	String header
	String content
	String footer

	HashMap<String, Object> parameters
	OverwritePolicy overwritePolicy
	String documentation
	String version

	boolean skipStamping

	new() {
	}

	def build() {
		if (id == null) {
			id = UUID.randomUUID
		}
		if (fileName.nullOrEmpty) {
			fileName = 'undefind-name'
		}
		if (fileType == null) {
			fileType = FileType.UNDEFINED
		}
		if (fileType == null) {
			overwritePolicy = OverwritePolicy.OVERWRITE
		}
		new BaseTemplate(id, fileName, fileType, relativPath, project, header, content, footer, parameters,
			overwritePolicy, documentation, version, false)
	}

	def id(UUID uuid) {
		this.id = uuid
		this
	}

	def fileName(String fileName) {
		this.fileName = fileName
		this
	}

	def fileType(FileType fileType) {
		this.fileType = fileType
		this
	}

	def relativPath(String relativPath) {
		this.relativPath = relativPath
		this
	}

	def project(Project project) {
		this.project = project
		this
	}

	def header(String header) {
		this.header = header
		this
	}

	def content(String content) {
		this.content = content
		this
	}

	def footer(String footer) {
		this.footer = footer
		this
	}

	def version(String version) {
		this.version = version
		this
	}

	def documentation(String documentation) {
		this.documentation = documentation
		this
	}
}

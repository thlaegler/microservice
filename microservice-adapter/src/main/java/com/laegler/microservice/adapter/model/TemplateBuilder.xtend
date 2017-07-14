package com.laegler.microservice.adapter.model

import java.util.HashMap
import java.util.UUID
import javax.inject.Named
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject
import com.laegler.microservice.adapter.util.StringUtil

@Named
class TemplateBuilder {

	@Inject protected World world
	@Inject protected NamingStrategy namingStrategy
	@Inject protected StringUtil stringUtil

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
		if (id === null) {
			id = UUID.randomUUID
		}
		if (fileName.nullOrEmpty) {
			fileName = 'undefind-name'
		}
		if (fileType === null) {
			fileType = FileType.UNDEFINED
		}
		if (overwritePolicy === null) {
			overwritePolicy = OverwritePolicy.OVERWRITE
		}
		if (parameters === null) {
			parameters = new HashMap
		}
		if (version === null) {
			version = '0.0.1-SNAPSHOT'
		}
		val template = new Template(id, fileName, fileType, relativPath, project, header, footer, documentation,
			version, parameters, overwritePolicy, false)
		template
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

	def skipStamping(boolean skipStamping) {
		this.skipStamping = skipStamping
		this
	}

}

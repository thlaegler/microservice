package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.OverwritePolicy
import com.laegler.microservice.codegen.model.Project
import java.util.HashMap
import java.util.UUID
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

/**
 * Abstract super type for all templates.
 */
@Accessors(#[NONE, PUBLIC_GETTER])
//@FinalFieldsConstructor
class BaseTemplate extends AbstractTemplate {

	new(UUID uuid, String fileName, FileType fileType, String relativPath, Project project, String header,
		String content, String footer, HashMap<String, Object> parameters, OverwritePolicy overwritePolicy,
		String documentation, String version, boolean skipStamping) {
		super(project)
		this.id = uuid
		this.fileName = fileName
		this.fileType = fileType
		this.relativPath = relativPath
		this.header = header
		this.content = content
		this.footer = footer
		this.parameters = parameters
		this.overwritePolicy = overwritePolicy
		this.documentation = documentation
		this.version = version
		this.skipStamping=skipStamping
	}

	public static def TemplateBuilder getBuilder() {
		new TemplateBuilder
	}

	public override String getFullPathWithName() {
		'''«project.directory»/«relativPath»/«fileName».«fileType.extension»'''
	}

	protected override String getTemplateName() {
		this.class.canonicalName
	}

}

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

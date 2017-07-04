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
		this.skipStamping = skipStamping
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

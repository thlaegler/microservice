package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * Abstract super type for all XML files.
 */
abstract class AbstractXmlTemplate extends AbstractTemplate {

	new(Project project) {
		super(project)
		this.fileType = FileType.XML
	}

//	new(String fileName, String relativPath, Project project, String header, String content, String footer,
//		HashMap parameters, OverwritePolicy overwritePolicy, String documentation, String version,
//		boolean skipStamping) {
//			super(project, fileName, FileType.XML, relativPath, project, header, content, footer, parameters,
//				overwritePolicy, documentation, version, skipStamping)
//		}
}

package com.laegler.microservice.codegen.model

import java.io.File
import java.util.logging.Logger
import javax.inject.Inject
import com.laegler.microservice.codegen.template.utils.AbstractTemplate

/**
 * 
 */
class TemplateProvider {

	@Inject protected Logger log
	@Inject protected FileHelper fileHelper

	public def boolean generateFile(AbstractTemplate template) {
		log.info('''Try to generate file from «template.fullPathWithName»''')

		// Don't overwrite existing files if defined in template
		if (template.overwritePolicy != OverwritePolicy.OVERWRITE) {

			val File file = fileHelper.findFile(template.fullPathWithName)
			if (file != null) {

				// Check if there are file changes
				if (fileHelper.getFileContent(file).equalsIgnoreCase(template.fileContent)) {
					log.
						info('''No changes in file so we skip generation and keep the old version for file «template.fullPathWithName»''')
					return false
				}

				// Compare versions
				val String fileVersion = fileHelper.getFileVersion(file)
				val int versionCompare = fileHelper.versionCompare(fileVersion, template.version)
				if (versionCompare > 0) {
					log.info('''Version is older than the existing version for file «template.fullPathWithName»''')
					return false
				}
			}
		}

		log.info('''Generating file «template.fullPathWithName»''')
//		stubbr.fsa.generateFile('''../«template.fullPathWithName»''', template.fileContent)
		log.info('''Successfully generated file «template.fullPathWithName»''')
		true
	}

}

package com.laegler.microservice.codegen.template.utils

import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.FileType

/**
 * File Generator for github documentation (README.MD)
 */
abstract class AbstractReadmeMdTemplate extends AbstractTemplate {

	/**
	 * 
	 */
	new(Project project) {
		super(project)
		fileType = FileType.MD
		fileName = 'README'
		relativPath = '/'
		documentation = 'Github documentation (README.MD)'
		skipStamping = true

		content = template
	}

	private def String getTemplate() '''
		«project?.canonicalName»
				
		«model.getOption('documentation')»
		
		# Stakeholders
		## Organizations
		«model.getOption('organizationName')»
«««		«FOR Organization organization : model.getOption('documentation').stakeholders?.organizations»
«««			* «organization?.name»
«««		«ENDFOR»
		
		## Developers
«««		«FOR Person person : stubbr?.stubb?.stakeholders?.persons»
«««			* «person?.name»
«««		«ENDFOR»
	'''
}

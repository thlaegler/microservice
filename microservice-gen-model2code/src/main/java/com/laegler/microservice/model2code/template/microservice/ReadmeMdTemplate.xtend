package com.laegler.microservice.model2code.template.microservice

import com.laegler.microservice.adapter.util.Project
import com.laegler.microservice.adapter.util.FileType
import com.laegler.microservice.model2code.template.base.AbstractReadmeMdTemplate

/**
 * File Generator for github documentation (README.MD)
 */
abstract class ReadmeMdTemplate extends AbstractReadmeMdTemplate {

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

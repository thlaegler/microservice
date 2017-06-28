package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * File Generator for github documentation (README.MD)
 */
abstract class AbstractReadmeMdTemplate extends AbstractTemplate {

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
		
		## DNvelopers
«««		«FOR Person person : stubbr?.stubb?.stakeholders?.persons»
«««			* «person?.name»
«««		«ENDFOR»
	'''
	
//	new(Project project, String header, String content, String footer, HashMap parameters,
//		OverwritePolicy overwritePolicy, String documentation, String version) {
//		super(UUID.randomUUID, 'README', FileType.MD, '/', project, header, content, footer, parameters,
//			overwritePolicy, documentation, version, true)
//	}

}

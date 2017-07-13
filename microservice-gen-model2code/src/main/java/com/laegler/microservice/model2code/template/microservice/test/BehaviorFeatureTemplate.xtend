package com.laegler.microservice.model2code.template.microservice.test

import com.laegler.microservice.adapter.util.FileType
import com.laegler.microservice.adapter.util.Project
import com.laegler.microservice.model2code.template.base.AbstractTemplate
import gherkin.ast.Feature
import gherkin.ast.ScenarioDefinition

/**
 * File template for Cucumber feature definition.
 */
class BehaviorFeatureTemplate extends AbstractTemplate {

	private Feature feature

	new(Project p, Feature feature) {
		super(p)
		this.feature = feature
		fileType = FileType.FEATURE
		fileName = '''«feature?.name?.toLowerCase.replaceAll(' ', '')»'''
		relativPath = '''/src-gen/test/java/«project?.basePackage?.toPath»/feature/«feature?.name?.replaceAll('"', '').toLowerCase»/'''
		documentation = '''
			The Cucumber feature definition for «feature?.name?.toFirstUpper» «feature?.name?.replaceAll('"', '')»
			
			Scenarios:
			<ul>
			«FOR ScenarioDefinition scenario : feature?.children»
				<li>«scenario?.name?.toFirstUpper» - «scenario?.name?.replaceAll('"', '')»</li>
			«ENDFOR»
			</ul>
		'''

		content = template
	}

	private def String getTemplate() '''
		# language: en
		Feature: «feature?.name?.toFirstUpper» - «feature?.name?.replaceAll('"', '')»
	
			«FOR ScenarioDefinition scenario : feature?.children»
				Scenario: «scenario?.name?.toFirstUpper» - «scenario?.name?.replaceAll('"', '')»
«««						«FOR GivenStep step : scenario.givenSteps»
«««							Given «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')»
«««						«ENDFOR»
«««						«FOR WhenStep step : scenario.whenSteps»
«««							When «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» «step?.action» «step?.value» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»
«««						«ENDFOR»
«««						«FOR ThenStep step : scenario.thenSteps»
«««							Then «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» should «step?.action» «step?.value» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»
«««						«ENDFOR»
					
			«ENDFOR»
	'''

}

package com.laegler.microservice.codegen.template.microservice.test

import com.laegler.microservice.codegen.template.utils.AbstractTemplate
import gherkin.ast.Feature
import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Microservice
import gherkin.ast.Scenario
import gherkin.ast.ScenarioDefinition

/**
 * File template for Cucumber feature definition.
 */
class BehaviorFeatureTemplate extends AbstractTemplate {

	private Feature feature

	/**
	 * 
	 */
	new(Microservice m, Feature feature) {
		super(m)
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

package com.laegler.microservice.model2code.template.microservice.test

import gherkin.ast.Feature
import gherkin.ast.ScenarioDefinition
import javax.inject.Named
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.World
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import org.slf4j.Logger
import javax.inject.Inject

@Named
class CucumberFeature {

	protected static final Logger LOG = LoggerFactory.getLogger(CucumberFeature)

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	private Feature feature

	public def Template getTemplate(Project project) {
		LOG.debug('Generate template CucumberFeatureTemplateBuilder')

		templateBuilder //
		.project(project) //
		.fileName(feature.name?.toLowerCase.replaceAll(' ', '')) //
		.fileType(FileType.FEATURE) //
		.relativPath(namingStrategy.getAbsoluteTestSourcePath(project.name) + '/' + feature.name) //
		.documentation('''
			The Cucumber feature definition for «feature?.name?.toFirstUpper» «feature?.name?.replaceAll('"', '')»
				
				Scenarios:
				<ul>
				«FOR ScenarioDefinition scenario : feature?.children»
					<li>«scenario?.name?.toFirstUpper» - «scenario?.name?.replaceAll('"', '')»</li>
				«ENDFOR»
				</ul>
		''') //
		.skipStamping(true) //
		.content('''
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
		''').build
	}

}

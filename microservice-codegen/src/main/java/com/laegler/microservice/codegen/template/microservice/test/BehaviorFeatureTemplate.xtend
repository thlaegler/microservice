package templates.faces.src_test_java_basepack.faces

import com.laegler.stubbr.lang.genmodel.FileType
import com.laegler.stubbr.lang.genmodel.Project
import com.laegler.stubbr.lang.stubbrLang.Feature
import com.laegler.stubbr.lang.stubbrLang.GivenStep
import com.laegler.stubbr.lang.stubbrLang.Scenario
import com.laegler.stubbr.lang.stubbrLang.ThenStep
import com.laegler.stubbr.lang.stubbrLang.WhenStep
import templates.AbstractTemplate
import com.laegler.stubbr.lang.generator.repository.StubbrRegistry

/**
 * File template for Cucumber feature definition.
 */
class BehaviorFeatureTemplate extends AbstractTemplate {

	private Feature feature

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project, Feature feature) {
		super(stubbr, project)
		this.feature = feature
		fileType = FileType.FEATURE
		fileName = '''«feature?.name?.toLowerCase.replaceAll(' ', '')»'''
		relativPath = '''/src-gen/test/java/«project?.basePackage?.toPath»/feature/«feature?.name?.replaceAll('"', '').toLowerCase»/'''
		documentation = '''
			The Cucumber feature definition for «feature?.name?.toFirstUpper» «feature?.label?.replaceAll('"', '')»
			
			Scenarios:
			<ul>
			«FOR Scenario scenario : feature?.scenarios»
				<li>«scenario?.name?.toFirstUpper» - «scenario?.label?.replaceAll('"', '')»</li>
			«ENDFOR»
			</ul>
		'''

		content = template
	}

	private def String getTemplate() '''
		# language: en
		Feature: «feature?.name?.toFirstUpper» - «feature?.label?.replaceAll('"', '')»
	
			«FOR Scenario scenario : feature?.scenarios»
			Scenario: «scenario?.name?.toFirstUpper» - «scenario?.label?.replaceAll('"', '')»
				«FOR GivenStep step : scenario.givenSteps»
				Given «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')»
				«ENDFOR»
				«FOR WhenStep step : scenario.whenSteps»
				When «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» «step?.action» «step?.value» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»
				«ENDFOR»
				«FOR ThenStep step : scenario.thenSteps»
				Then «step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» should «step?.action» «step?.value» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»
				«ENDFOR»
				
			«ENDFOR»
		'''

}

package templates.faces.src_test_java_basepack.faces

import com.laegler.stubbr.lang.generator.repository.StubbrRegistry
import com.laegler.stubbr.lang.genmodel.Project
import com.laegler.stubbr.lang.stubbrLang.Feature
import com.laegler.stubbr.lang.stubbrLang.GivenStep
import com.laegler.stubbr.lang.stubbrLang.Scenario
import com.laegler.stubbr.lang.stubbrLang.ThenStep
import com.laegler.stubbr.lang.stubbrLang.WhenStep
import templates.AbstractXtendTemplate

/**
 * File template for Cucumber feature steps (glue).
 */
class BehaviorFeatureStepsXtendTemplate extends AbstractXtendTemplate {

	private Feature feature

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project, Feature feature) {
		super(stubbr, project)
		this.feature = feature
		fileName = '''«feature?.name?.replaceAll(' ', '').toFirstUpper»StepDefinitions'''
		relativPath = '''/src-gen/test/java/«project?.basePackage?.toPath»/feature/«feature?.name?.replaceAll('"', '').toLowerCase»/'''
		documentation = '''Cucumber feature step definitions (glue) for «feature?.name?.toFirstUpper» - «feature?.label?.replaceAll('"', '')»'''

		content = template
	}

	private def String getTemplate() '''
		package «project?.basePackage».feature.«feature?.name?.replaceAll('"', '').toLowerCase»
		
		import «project?.basePackage».*
		import com.google.gson.annotations.Until
		import javax.annotation.Generated
		import javax.annotation.PostConstruct
		import javax.annotation.security.PermitAll
		import javax.inject.Inject
		import org.slf4j.Logger
		import cucumber.api.java.en.Given;
		import cucumber.api.java.en.Then;
		import cucumber.api.java.en.When;
		
		«javaDocType»
		class «fileName» {
		
			@Inject Logger log
		
			«FOR Scenario scenario : feature?.scenarios»
				«FOR GivenStep given : scenario?.givenSteps»
					«given?.toAnnotation»
					public def void «given?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
						// TODO «given?.actor?.name»
					}
				«ENDFOR»
				«FOR WhenStep when : scenario?.whenSteps»
					«when?.toAnnotation»
					public def void «when?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
						// TODO «when?.actor?.name»
					}
				«ENDFOR»
				«FOR ThenStep then : scenario?.thenSteps»
					«then?.toAnnotation»
					public def void «then?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
						// TODO «then?.actor?.name»
					}
				«ENDFOR»

			«ENDFOR»
		}
	'''
	
	private def String toMethodName(GivenStep step) {
		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»'''
		return toMethodName(name)
	}
	
	private def String toMethodName(WhenStep step) {
		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»_«step?.action» «step?.value»_«step?.subjectElement?.name»«step?.subjectWildcard»'''
		return toMethodName(name)
	}
	
	private def String toMethodName(ThenStep step) {
		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»_should_«step?.action» «step?.value»_«step?.subjectElement?.name»«step?.subjectWildcard»'''
		return toMethodName(name)
	}
	 
	private def String toMethodName(String methodName) {
		methodName.replaceAll(' ', '').replaceAll('"', '').toFirstLower
	}

	private def String toAnnotation(GivenStep step) '''
		@Given("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')»$")
	'''
	
	private def String toAnnotation(WhenStep step) '''
		@When("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» «step?.action» «step?.value?.replaceAll('"', '')» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»$")
	'''
	
	private def String toAnnotation(ThenStep step) '''
		@Then("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» should «step?.action» «step?.value?.replaceAll('"', '')» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»$")
	'''
			
}

package com.laegler.microservice.model2code.template.microservice.app.test

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Xtend
import gherkin.ast.GherkinDocument
import gherkin.ast.ScenarioDefinition
import org.slf4j.Logger
import org.slf4j.LoggerFactory

class DefaultCucumberFeatureStepsXtend extends Xtend {

	protected static final Logger LOG = LoggerFactory.getLogger(DefaultCucumberFeatureStepsXtend)

	public def Template getTemplate(Project p, GherkinDocument gherkin) {
		LOG.debug('  Generating template CucumberFeatureSteps.xtend')

		if (gherkin === null || gherkin.feature === null) {
			LOG.info('    No gherkin file provided. Template generation of {}.feature skipped.', p.name)
			return null
		}
		val feature = gherkin.feature
		
		templateBuilder//
		.project(p) //
		.fileName(feature.name?.toLowerCase.replaceAll(' ', '').toFirstUpper + 'StepDefinitions') //
		.fileType(FileType.XTEND) //
		.relativPath(namingStrategy.getAbsoluteGeneratedTestSourcePath(p.name) + '/' + feature.name) //
		.documentation('''Cucumber feature step definitions (glue) for «feature?.name?.toFirstUpper» - «feature?.name?.replaceAll('"', '')»''')//
		.skipStamping(true) //
		.content('''
			package «p?.basePackage».feature.«feature?.name?.replaceAll('"', '').toLowerCase»
			
			import «p?.basePackage».*
			import javax.annotation.Generated
			import javax.annotation.PostConstruct
			import javax.annotation.security.PermitAll
			import javax.inject.Inject
			import org.slf4j.Logger
			import cucumber.api.java.en.Given;
			import cucumber.api.java.en.Then;
			import cucumber.api.java.en.When;
			
			«p.javaDocType»
			class «feature.name?.toLowerCase?.replaceAll(' ', '')?.toFirstUpper + 'StepDefinitions'» {
			
				@Inject Logger log
			
				«FOR ScenarioDefinition scenario : feature?.children»
	«««				«FOR GivenStep given : scenario?.givenSteps»
	«««					«given?.toAnnotation»
	«««					public def void «given?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
	«««						// TODO «given?.actor?.name»
	«««					}
	«««				«ENDFOR»
	«««				«FOR WhenStep when : scenario?.whenSteps»
	«««					«when?.toAnnotation»
	«««					public def void «when?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
	«««						// TODO «when?.actor?.name»
	«««					}
	«««				«ENDFOR»
	«««				«FOR ThenStep then : scenario?.thenSteps»
	«««					«then?.toAnnotation»
	«««					public def void «then?.toMethodName.replaceAll(' ', '').replaceAll('"', '')»() throws Throwable {
	«««						// TODO «then?.actor?.name»
	«««					}
	«««				«ENDFOR»
	
				«ENDFOR»
			}
		''')//
		.build
	}
	
//	private def String toMethodName(GivenStep step) {
//		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»'''
//		return toMethodName(name)
//	}
//	
//	private def String toMethodName(WhenStep step) {
//		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»_«step?.action» «step?.value»_«step?.subjectElement?.name»«step?.subjectWildcard»'''
//		return toMethodName(name)
//	}
//	
//	private def String toMethodName(ThenStep step) {
//		var name = '''«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard»_should_«step?.action» «step?.value»_«step?.subjectElement?.name»«step?.subjectWildcard»'''
//		return toMethodName(name)
//	}
//	 
//	private def String toMethodName(String methodName) {
//		methodName.replaceAll(' ', '').replaceAll('"', '').toFirstLower
//	}
//
//	private def String toAnnotation(GivenStep step) '''
//		@Given("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')»$")
//	'''
//	
//	private def String toAnnotation(WhenStep step) '''
//		@When("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» «step?.action» «step?.value?.replaceAll('"', '')» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»$")
//	'''
//	
//	private def String toAnnotation(ThenStep step) '''
//		@Then("^«step?.actor?.name»«step?.actorElement?.name»«step?.objectWildcard?.replaceAll('"', '')» should «step?.action» «step?.value?.replaceAll('"', '')» «step?.subjectElement?.name»«step?.subjectWildcard?.replaceAll('"', '')»$")
//	'''
			
}

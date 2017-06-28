package com.laegler.microservice.codegen.adapter

import java.io.File
import java.util.HashMap
import java.util.Map
import javax.inject.Inject
import java.util.ArrayList
import java.util.List
import com.laegler.microservice.codegen.model.FileHelper
import gherkin.ast.GherkinDocument
import gherkin.TokenMatcher
import gherkin.AstBuilder
import gherkin.Parser
import com.laegler.microservice.codegen.model.Project
import gherkin.ParserException
import com.laegler.microservice.codegen.adapter.cucumber.XtendSnippet
import com.laegler.microservice.codegen.adapter.cucumber.Concatenator
import com.laegler.microservice.codegen.adapter.cucumber.SnippetGenerator
import com.laegler.microservice.codegen.adapter.cucumber.CamelCaseConcatenator
import com.laegler.microservice.codegen.adapter.cucumber.FunctionNameGenerator
import com.laegler.microservice.codegen.adapter.cucumber.Snippet
import gherkin.ast.ScenarioDefinition
import gherkin.ast.Step
import org.slf4j.LoggerFactory
import org.slf4j.Logger

/**
 * Reads, parses and generates Cucumber/Gherkin files.
 */
class GherkinAdapter implements StubbrAdapter<GherkinDocument> {

	private static Logger LOG = LoggerFactory.getLogger(GherkinAdapter)

	extension FileHelper fileHelper

	public override GherkinDocument parse(String fileLocation) {
		LOG.info('''Parsing Swagger YAML file.''')
		val File file = fileHelper.findFile(fileLocation)

		val String gherkinFileContent = file.asString

		val TokenMatcher matcher = new TokenMatcher => []
		val AstBuilder builder = new AstBuilder => []
		val Parser<GherkinDocument> parser = new Parser(builder) => [
			stopAtFirstError = false
		]

		try {
			val GherkinDocument featureModel = parser.parse(gherkinFileContent, matcher)
			LOG.info('Gherkin feature file successfully parsed')
			return featureModel
		} catch (ParserException e) {
			LOG.warn('''Failed to parse gherkin feature «file»''')
		}
		null
	}

	public override String generate(Project project, String fileLocation) {
		generate(project, fileLocation, new HashMap)
	}

	public override String generate(Project project, String fileLocation, Map<String, Object> params) {
		LOG.info('''Generate Cucumber snippets/stubs for feature «fileLocation».''')
		val GherkinDocument featureModel = parse(fileLocation)

		val Snippet snippet = new XtendSnippet
		val SnippetGenerator generator = new SnippetGenerator(snippet)
		val Concatenator concatenator = new CamelCaseConcatenator
		val FunctionNameGenerator fuctionNameGen = new FunctionNameGenerator(concatenator)

		val List<String> methodSnippets = new ArrayList<String>

		return '''
			package «project?.basePackage».feature
			
			import «project?.basePackage».*
			import cucumber.api.java.en.Given
			import cucumber.api.java.en.Then
			import cucumber.api.java.en.When
			
			class «featureModel?.feature?.name»StepDefinitions {
				«FOR ScenarioDefinition scenario : featureModel?.feature?.children»
					«FOR Step step : scenario?.steps»
						«val methodSnippet = generator.getSnippet(step, fuctionNameGen)»
						«IF !methodSnippets.contains(methodSnippet)»
							«methodSnippet»
							«methodSnippets.add(methodSnippet)»
						«ENDIF»
					«ENDFOR»
				«ENDFOR»
			}
		'''
	}

}

package com.laegler.microservice.adapter.lib.cucumber

import java.io.File
import java.util.HashMap
import java.util.Map
import javax.inject.Inject
import java.util.ArrayList
import java.util.List
import gherkin.TokenMatcher
import gherkin.AstBuilder
import gherkin.Parser
import gherkin.ParserException
import gherkin.ast.ScenarioDefinition
import gherkin.ast.Step
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import gherkin.ast.GherkinDocument
import com.laegler.microservice.adapter.model.Project
import javax.inject.Named
import com.laegler.microservice.adapter.util.Adapter

/**
 * Reads, parses and generates Cucumber/Gherkin files.
 */
@Named
class GherkinAdapter extends Adapter<GherkinDocument> {

	private static Logger LOG = LoggerFactory.getLogger(GherkinAdapter)

	public override GherkinDocument parse(String fileLocation) {
		LOG.info('''Parsing Swagger YAML file.''')
		val File file = fileHelper.findFile(fileLocation)

		val String gherkinFileContent = fileHelper.asString(file)

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

	override generate(Project project, String fileLocation) {
		generate(project, fileLocation, new HashMap)
	}

	override generate(Project project, String fileLocation, Map<String, Object> params) {
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

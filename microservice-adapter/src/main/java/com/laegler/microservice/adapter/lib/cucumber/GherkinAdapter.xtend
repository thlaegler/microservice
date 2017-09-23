package com.laegler.microservice.adapter.lib.cucumber

import com.laegler.microservice.adapter.lib.SpecAdapter
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.FileUtil
import gherkin.AstBuilder
import gherkin.Parser
import gherkin.ParserException
import gherkin.TokenMatcher
import gherkin.ast.GherkinDocument
import gherkin.ast.ScenarioDefinition
import gherkin.ast.Step
import java.io.File
import java.io.FileWriter
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import javax.inject.Inject
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

/**
 * Reads, parses and generates Cucumber/Gherkin files.
 */
@Named
class GherkinAdapter implements SpecAdapter<GherkinDocument> {
	
	private static Logger LOG = LoggerFactory.getLogger(GherkinAdapter)
	
	@Inject protected World world
	@Inject protected FileUtil fileHelper
	
	override toString(GherkinDocument specModel) {
		generate(specModel)
	}
	
	override toFile(GherkinDocument specModel, File specFile) {
		val writer = new FileWriter(specFile)
		writer.write(generate(specModel))
	}
	
	override toModel(String specString) {
		parse(specString)
	}
	
	override toModel(File specFile) {
		parse(fileHelper.asString(specFile))
	}

	private def GherkinDocument parse(String specString) {
		LOG.debug('Parsing gherkin file: {}', specString)
		
		val TokenMatcher matcher = new TokenMatcher => []
		val AstBuilder builder = new AstBuilder => []
		val Parser<GherkinDocument> parser = new Parser(builder) => [
			stopAtFirstError = false
		]

		try {
			val GherkinDocument featureModel = parser.parse(specString, matcher)
			LOG.debug('Gherkin feature file successfully parsed: {}', featureModel.toString)
			return featureModel
		} catch (ParserException e) {
			LOG.error('Failed to parse gherkin feature {}', specString)
			LOG.error(e.message)
		}
		null
	}

	private def String generate(GherkinDocument model) {
		generate(model, new HashMap)
	}

	private def String generate(GherkinDocument model, Map<String, Object> params) {
		LOG.debug('''Generate Cucumber snippets/stubs for feature «model».''')

		val Snippet snippet = new XtendSnippet
		val SnippetGenerator generator = new SnippetGenerator(snippet)
		val Concatenator concatenator = new CamelCaseConcatenator
		val FunctionNameGenerator fuctionNameGen = new FunctionNameGenerator(concatenator)

		val List<String> methodSnippets = new ArrayList<String>

		return '''
			package «params.get("basePackage")».feature
			
			import «params.get("basePackage")».*
			import cucumber.api.java.en.Given
			import cucumber.api.java.en.Then
			import cucumber.api.java.en.When
			
			class «model?.feature?.name»StepDefinitions {
				«FOR ScenarioDefinition scenario : model?.feature?.children»
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

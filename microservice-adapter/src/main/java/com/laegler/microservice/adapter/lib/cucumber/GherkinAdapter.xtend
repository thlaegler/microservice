package com.laegler.microservice.adapter.lib.cucumber

import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.util.Adapter
import gherkin.AstBuilder
import gherkin.Parser
import gherkin.ParserException
import gherkin.TokenMatcher
import gherkin.ast.GherkinDocument
import gherkin.ast.ScenarioDefinition
import gherkin.ast.Step
import java.io.File
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import javax.inject.Named
import org.slf4j.Logger
import org.slf4j.LoggerFactory

/**
 * Reads, parses and generates Cucumber/Gherkin files.
 */
@Named
class GherkinAdapter extends Adapter<GherkinDocument> {

	private static Logger LOG = LoggerFactory.getLogger(GherkinAdapter)

	public override GherkinDocument parse(String fileLocation) {
		LOG.debug('Parsing gherkin file: {}', fileLocation)
		val File file = fileHelper.findFile(fileLocation)
		
		if(file === null) {
			LOG.debug('No file found at: {}. Aborting gherkin parsing.',fileLocation)
			return null
		}

		val String gherkinFileContent = fileHelper.asString(file)
		LOG.debug('Gherkin file content: {}', gherkinFileContent)

		val TokenMatcher matcher = new TokenMatcher => []
		val AstBuilder builder = new AstBuilder => []
		val Parser<GherkinDocument> parser = new Parser(builder) => [
			stopAtFirstError = false
		]

		try {
			val GherkinDocument featureModel = parser.parse(gherkinFileContent, matcher)
			LOG.debug('Gherkin feature file successfully parsed: {}', featureModel.toString)
			return featureModel
		} catch (ParserException e) {
			LOG.error('Failed to parse gherkin feature {{} - {}', fileLocation, file.toString)
			LOG.error(e.message)
		}
		null
	}

	override generate(Project project, String fileLocation) {
		generate(project, fileLocation, new HashMap)
	}

	override generate(Project project, String fileLocation, Map<String, Object> params) {
		LOG.debug('''Generate Cucumber snippets/stubs for feature «fileLocation».''')
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

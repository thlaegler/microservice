package com.laegler.microservice.model2code

import com.laegler.microservice.adapter.lib.yaml.YamlAdapter
import com.laegler.microservice.adapter.util.FileUtil
import com.laegler.microservice.model.ModelRoot
import java.io.File
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import javax.inject.Inject

class Runner {

	private static final Logger LOG = LoggerFactory.getLogger(Runner)

	YamlAdapter yamlAdapter
	FileUtil fileUtil

	@Inject Model2CodeTransformator model2CodeTransformator

	def static void main(String[] args) {
		var file = args.head
		if (file.isNullOrEmpty) {
			file = '/home/thomas/git/microservice/microservice-example/architecture.yml'
		}
		val runner = new Runner()
		runner.read(new File(file))
	}

	def ModelRoot read(File file) {
		yamlAdapter = new YamlAdapter
		fileUtil = new FileUtil
		val modelRoot = yamlAdapter.deserialize(fileUtil.asString(file))
		modelRoot.architecture.artifacts.forEach [
			LOG.info('''Reading artifact: «it.name»''')
		]
		
		model2CodeTransformator.generate(modelRoot.architecture)
		
		modelRoot
	}

}

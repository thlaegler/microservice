package com.laegler.microservice.adapter.lib.yaml

import com.laegler.microservice.adapter.lib.SpecAdapter
import com.laegler.microservice.model.ModelRoot
import java.io.File
import java.io.FileInputStream
import java.io.FileWriter
import org.yaml.snakeyaml.Yaml
import javax.inject.Named

@Named
class YamlAdapter implements SpecAdapter<ModelRoot> {

	override toString(ModelRoot specModel) {
		val Yaml yaml = new Yaml
		yaml.dump(specModel)
	}

	override toFile(ModelRoot specModel, File specFile) {
		val Yaml yaml = new Yaml
		val writer = new FileWriter(specFile)
		yaml.dump(specModel, writer)
	}

	override toModel(String specString) {
		val Yaml yaml = new Yaml
		yaml.loadAs(specString, ModelRoot)
	}

	override toModel(File specFile) {
		val Yaml yaml = new Yaml
		val inputStream = new FileInputStream(specFile);
		yaml.loadAs(inputStream, ModelRoot)
	}

}

package com.laegler.microservice.adapter.lib.json

import com.laegler.microservice.adapter.lib.SpecAdapter
import com.laegler.microservice.model.ModelRoot
import gherkin.deps.com.google.gson.Gson
import java.io.File
import java.io.FileReader
import java.io.FileWriter
import javax.inject.Named

@Named
class JsonAdapter implements SpecAdapter<ModelRoot> {
	
	override toString(ModelRoot specModel) {
		val Gson gson = new Gson
		gson.toJson(specModel)
	}
	
	override toFile(ModelRoot specModel, File specFile) {
		val Gson gson = new Gson
		val writer = new FileWriter(specFile)
		gson.toJson(specModel, writer)
	}
	
	override toModel(String specString) {
		val Gson gson = new Gson
		gson.fromJson(specString, ModelRoot)
	}
	
	override toModel(File specFile) {
		val Gson gson = new Gson
		val reader = new FileReader(specFile)
		gson.fromJson(reader, ModelRoot)
	}

}

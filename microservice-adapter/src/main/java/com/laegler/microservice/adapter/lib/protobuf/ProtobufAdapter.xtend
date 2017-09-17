package com.laegler.microservice.adapter.lib.protobuf

import com.laegler.microservice.adapter.lib.SpecAdapter
import com.squareup.protoparser.ProtoFile
import com.squareup.protoparser.ProtoParser
import java.io.File
import java.io.FileReader
import javax.inject.Named

@Named
class ProtobufAdapter implements SpecAdapter<ProtoFile> {

	override toString(ProtoFile specModel) {
		throw new RuntimeException("method not implemented")
	}

	override toFile(ProtoFile specModel, File specFile) {
		throw new RuntimeException("method not implemented")
	}

	override toModel(String specString) {
		ProtoParser.parse("test", specString)
	}

	override toModel(File specFile) {
		val reader = new FileReader(specFile)
		ProtoParser.parse("test", reader)
	}

}

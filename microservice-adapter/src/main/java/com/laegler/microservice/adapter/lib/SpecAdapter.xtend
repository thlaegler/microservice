package com.laegler.microservice.adapter.lib

import java.io.File

interface SpecAdapter<M> {
	
	public def String toString(M specModel)
	
	public def void toFile(M specModel, File specFile)

	public def M toModel(String specString)
	
	public def M toModel(File specFile)
	
}
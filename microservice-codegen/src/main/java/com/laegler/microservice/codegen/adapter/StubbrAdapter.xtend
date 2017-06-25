package com.laegler.microservice.codegen.adapter

import java.util.Map
import com.laegler.microservice.codegen.model.Project

interface StubbrAdapter<T> {

	public def T parse(String fileLocation)

	public def String generate(Project project, String fileLocation)

	public def String generate(Project project, String fileLocation, Map<String, Object> params)

}

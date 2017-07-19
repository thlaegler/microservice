package com.laegler.microservice.adapter.util

import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import javax.enterprise.inject.Produces
import io.swagger.codegen.config.CodegenConfigurator
import io.swagger.codegen.DefaultGenerator
import io.swagger.parser.SwaggerParser

class InjectionProducer {

	
	@Produces
	def public MavenXpp3Reader getMavenXpp3Reader() {
		new MavenXpp3Reader
	}

	@Produces
	def public SwaggerParser getSwaggerParser() {
		new SwaggerParser
	}

	@Produces
	def public CodegenConfigurator getSwaggerCodegenConfigurator() {
		new CodegenConfigurator
	}

	@Produces
	def public DefaultGenerator getSwaggerDefaultGenerator() {
		new DefaultGenerator
	}
}

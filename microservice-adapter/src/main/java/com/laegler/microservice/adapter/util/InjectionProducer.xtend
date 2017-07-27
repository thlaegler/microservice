package com.laegler.microservice.adapter.util

import io.swagger.codegen.DefaultGenerator
import io.swagger.codegen.config.CodegenConfigurator
import io.swagger.parser.SwaggerParser
import javax.enterprise.inject.Produces
import javax.enterprise.inject.spi.InjectionPoint
import javax.inject.Singleton
import org.apache.maven.model.io.xpp3.MavenXpp3Reader
import org.apache.maven.model.io.xpp3.MavenXpp3Writer
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Singleton
class InjectionProducer {

	@Produces
	public def MavenXpp3Reader getMavenXpp3Reader() {
		new MavenXpp3Reader
	}

	@Produces
	public def MavenXpp3Writer getMavenXpp3Writer() {
		new MavenXpp3Writer
	}

	@Produces
	public def SwaggerParser getSwaggerParser() {
		new SwaggerParser
	}

	@Produces
	public def CodegenConfigurator getSwaggerCodegenConfigurator() {
		new CodegenConfigurator
	}

	@Produces
	public def DefaultGenerator getSwaggerDefaultGenerator() {
		new DefaultGenerator
	}

	@Produces
	public def Logger createLogger(InjectionPoint ip) {
		return LoggerFactory.getLogger(ip.getMember().getDeclaringClass());
	}

}

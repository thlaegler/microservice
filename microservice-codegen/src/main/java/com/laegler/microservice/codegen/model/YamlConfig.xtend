package com.laegler.microservice.codegen.model

import java.util.Map

class YamlConfig {

	var Map<String, ServiceConfig> applications;

	public def Map<String, ServiceConfig> getApplications() {
		return applications;
	}

	public def void setApplications(Map<String, ServiceConfig> applications) {
		this.applications = applications;
	}

	override String toString() {
		return "YamlConfig{" +
				"applications=" + applications +
				'}'
	}
}
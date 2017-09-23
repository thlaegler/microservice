package com.laegler.microservice.adapter.model;

public enum SpecificationType {

	OPEN_API("api.yaml"), //
	PROTOBUF(".proto"), //
	WSDL(".wsdl"), //
	FEATURE(".feature"), //
	SPRING("application.yaml"), //
	WADL(".wadl"), //
	RSDL(".rsdl"), //
	RAML(".raml"), //

	UNDEFINED("");

	private String matcher;

	SpecificationType(String matcher) {
		this.matcher = matcher;
	}

	public String getMatcher() {
		return matcher;
	}

}

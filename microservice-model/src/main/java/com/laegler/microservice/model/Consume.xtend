package com.laegler.microservice.model

import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Consume {

	String endpoint
	String type

	public def EndpointType getEndpointType() {
		EndpointType.valueOf(type)
	}

	public def setEndpointType(EndpointType type) {
		this.type = type.name
	}
}

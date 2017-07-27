package com.laegler.microservice.model

import org.eclipse.xtend.lib.annotations.Accessors
import lombok.NoArgsConstructor
import lombok.AllArgsConstructor
import lombok.Builder

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Endpoint {

	String name
	String type
	
	public def EndpointType getEndpointType() {
		EndpointType.valueOf(type)
	}
	
	public def setEndpointType(EndpointType type) {
		this.type = type.name
	}
}

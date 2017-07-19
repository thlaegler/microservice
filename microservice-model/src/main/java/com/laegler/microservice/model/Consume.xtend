package com.laegler.microservice.model

import org.eclipse.xtend.lib.annotations.Accessors
import lombok.NoArgsConstructor
import lombok.AllArgsConstructor
import lombok.Builder
import java.util.List

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

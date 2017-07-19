package com.laegler.microservice.model

import java.util.List
import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Architecture {

	String name
	String basePackage
	List<Map<String, String>> options
	List<Artifact> artifacts

}

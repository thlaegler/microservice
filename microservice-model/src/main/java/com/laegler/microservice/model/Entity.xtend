package com.laegler.microservice.model

import java.util.Map
import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashMap

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Entity {

	String name

	// <Name, JvmType>
	Map<String, String> fields = new HashMap

}

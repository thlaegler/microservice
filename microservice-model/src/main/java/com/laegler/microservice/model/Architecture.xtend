package com.laegler.microservice.model

import java.util.List
import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import java.util.ArrayList
import java.util.HashMap

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Architecture {

	String name
	String basePackage
	String version
	String author
	String dirStrategy

	Map<String, Object> security = new HashMap
	Map<String, Object> test = new HashMap
	Map<String, Object> options = new HashMap
	Map<String, Object> build = new HashMap
	Map<String, Object> deployment = new HashMap
	Map<String, Object> atlassian = new HashMap
	
	List<Artifact> artifacts = new ArrayList

	public def DirStrategy getDirStrategyType() {
		if (dirStrategy.isNullOrEmpty) {
			return DirStrategy.DEEP
		} else {
			return DirStrategy.valueOf(dirStrategy)
		}
	}

	public def setDirStrategyType(DirStrategy dirStrategyType) {
		this.dirStrategy = dirStrategyType.name
	}

}

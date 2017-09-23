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

	Map<String, String> options = new HashMap
	Map<String, String> build = new HashMap
	Map<String, String> deployment = new HashMap
	Map<String, String> atlassian = new HashMap
	
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

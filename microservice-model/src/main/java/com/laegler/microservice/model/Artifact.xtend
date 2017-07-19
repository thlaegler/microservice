package com.laegler.microservice.model

import java.util.List
import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Artifact {                                      

	String name
	String type
	Persistence persistence
	List<Expose> exposes
	List<Consume> consumes

	public def ArtifactType getArtifactType() {
		ArtifactType.valueOf(type)
	}
	
	public def setArtifactType(ArtifactType type) {
		this.type = type.name
	}
	
}

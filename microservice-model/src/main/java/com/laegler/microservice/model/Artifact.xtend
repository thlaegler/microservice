package com.laegler.microservice.model

import java.util.List
import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class Artifact {

	String name
	String type
	String springConfig
	String feature
	List<Entity> entities = new ArrayList
	List<DatabaseType> data = new ArrayList

	List<Expose> exposes = new ArrayList
	List<Consume> consumes = new ArrayList

	public def ArtifactType getArtifactType() {
		ArtifactType.valueOf(type)
	}

	public def setArtifactType(ArtifactType type) {
		this.type = type.name
	}

}

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
class Persistence {
	
	List<DatabaseType> databases
	List<Entity> entities
}

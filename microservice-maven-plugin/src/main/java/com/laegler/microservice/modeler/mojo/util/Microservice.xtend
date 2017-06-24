package com.laegler.microservice.modeler.mojo.util

import org.apache.maven.model.Model
import java.io.File
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtend.lib.annotations.Data

@Data
@FinalFieldsConstructor
class Microservice {
	val String name
	val Model pom
	val File directory
}
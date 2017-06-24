/*
 * generated by Xtext 2.12.0
 */
package com.laegler.microservice.modeler.idea

import com.google.inject.Guice
import com.laegler.microservice.modeler.ArchitectureLangRuntimeModule
import com.laegler.microservice.modeler.ArchitectureLangStandaloneSetupGenerated
import org.eclipse.xtext.util.Modules2

class ArchitectureLangStandaloneSetupIdea extends ArchitectureLangStandaloneSetupGenerated {
	override createInjector() {
		val runtimeModule = new ArchitectureLangRuntimeModule()
		val ideaModule = new ArchitectureLangIdeaModule()
		val mergedModule = Modules2.mixin(runtimeModule, ideaModule)
		return Guice.createInjector(mergedModule)
	}
}
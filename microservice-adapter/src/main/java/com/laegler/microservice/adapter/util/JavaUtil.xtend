package com.laegler.microservice.adapter.util

import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.World
import javax.inject.Inject
import javax.inject.Named

@Named
class JavaUtil {

	@Inject private World world

	@Inject private extension StringUtil _string

	/**
	 * Template part for type-specific javadoc.
	 */
	public def String getJavaDocType(Project project) '''
		import org.slf4j.Logger;
		import org.slf4j.LoggerFactory;
		import javax.annotation.Generated;
		import com.google.gson.annotations.Until;
		import com.google.gson.annotations.Since;
		
		/**
		 * «project.documentation»
		 * 
		 * @author «world.author?.replaceAll('"','')» {@literal <«world.author»[at]«world.name»>}
		 * @since «project.version»
		 * @version «project.version»
		 * @generated «currentDate»
		 */
		@Since(0.1)
		//@Until(0.0)
		@Generated(value = '«»')
	'''

	/**
	 * Template part for method-specific javadoc.
	 */
	public def String getJavaDocMethod(Project project) '''
		/**
		 * «project.documentation»
		 * 
		 * @author «world.author?.replaceAll('"','')» {@literal <«world.author»[at]«world.name»>}
		 * @since «project.version»
		 * @version «project.version»
		 * @generated «currentDate»
		 */
		//@Since(«project.version»)
		@Until(0.0)
	'''

}

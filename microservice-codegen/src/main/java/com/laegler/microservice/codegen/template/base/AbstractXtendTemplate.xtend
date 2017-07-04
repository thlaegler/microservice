package com.laegler.microservice.codegen.template.base

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * Abstract super type for all Xtend files.
 */
abstract class AbstractXtendTemplate extends AbstractTemplate {

//	new(String fileName, String relativPath, Project project, String header, String content, String footer,
//		HashMap parameters, OverwritePolicy overwritePolicy, String documentation, String version,
//		boolean skipStamping) {
//			super(fileName, FileType.XTEND, relativPath, project, header, content, footer, parameters,
//				overwritePolicy, documentation, version, skipStamping)
//		}
	new(Project project) {
		super(project)
		this.fileType = FileType.XTEND
	}

	/**
	 * Template part for type-specific javadoc.
	 */
	protected def String getJavaDocType() '''
		import javax.annotation.Generated
		import com.google.gson.annotations.Until
		import com.google.gson.annotations.Since
		
		/**
		 * «documentation»
		 * 
		 * @author «model.getOption('author')?.replaceAll('"','')» {@literal <«model?.getOption('email')?.replace('@', '[at]').replaceAll('"','')»>} 
		 * @since «version»
		 * @version «version»
		 * @generated «currentDate»
		 */
		//@Since(«version»)
		@Until(0.0)
		@Generated(value = '«templateName»')
	'''

	/**
	 * Template part for method-specific javadoc.
	 */
	protected def String getJavaDocMethod() '''
		/**
		 * «documentation»
		 * 
		 * @author «model?.getOption('author')?.replaceAll('"','')» {@literal <«model?.getOption('email')?.replace('@', '[at]').replaceAll('"','')»>} 
		 * @since «version»
		 * @version «version»
		 * @generated «currentDate»
		 */
		//@Since(«version»)
		@Until(0.0)
	'''
}

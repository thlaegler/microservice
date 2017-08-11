package com.laegler.microservice.adapter.model

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.GregorianCalendar
import java.util.HashMap
import java.util.UUID
import javax.inject.Named
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import de.oehme.xtend.contrib.Buildable

/**
 * Abstract super type for all templates.
 */
@Named
@Buildable
@Accessors
@FinalFieldsConstructor
class Template {

	val UUID id
	val String fileName
	val FileType fileType
	val String relativPath
	val Project project
	val String header
	val String footer
	val String documentation
	val String version
	val HashMap<String, Object> parameters
	val OverwritePolicy overwritePolicy
	val boolean skipStamping

	val String content

	public def String getFullPathWithName() {
		if (fileType.extension == FileType.UNDEFINED) {
			return relativPath + fileName
		} else {
			return '''«relativPath»«fileName».«fileType.extension»'''
		}
	}

	public def String getTemplateName() {
		this.class.canonicalName
	}

	/**
	 * Assemble file content with header, footer and generation-stamp.
	 */
	public def String getFileContent() {
		if (header.nullOrEmpty && footer.nullOrEmpty) {
			return '''
				«stamp»
				«content»
			'''
		} else {
			if (header.contains('xmlns') || header.startsWith('/</?xml')) {
				return '''
					«header»
					«stamp»
						«content»
					«footer»
				'''
			} else {
				return '''
					«stamp»
					«header»
						«content»
					«footer»
				'''
			}
		}
	}

	public def String getStamp() {
		if (skipStamping == false) {
			if (fileType.lineComment !== null) {
				return '''
					«fileType.lineComment»Generated with Stubbr
					«fileType.lineComment»«documentation»
					«fileType.lineComment»{{{Version: «version»}}}
					«fileType.lineComment»{{{Date: «currentDate»}}}
				'''
			} else {
				return '''
					«fileType.beginComment»
						Generated with Stubbr
						«documentation»
						{{{Version: «version»}}}
						{{{Date: «currentDate»}}}
					«fileType.endComment»
				'''
			}
		}
	}

	public def String getCurrentDate() {
		val DateFormat sdf = new SimpleDateFormat('dd.MM.yyyy - HH:mm:ss:SS')
		val GregorianCalendar calendar = new GregorianCalendar
		sdf.format(calendar.time)
	}

}

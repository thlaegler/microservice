package com.laegler.microservice.adapter.util

import com.google.common.base.CaseFormat
import java.io.File
import javax.inject.Singleton

@Singleton
class StringUtil {

	/**
	 * Transform a String (version) into Double compatible String.
	 * 
	 * Note: This is so stupid!
	 */
	public def String versionDouble(String version) {
		version.replaceFirst('v', '').replaceFirst('.', '1234567890987654321').replaceAll('\\D', '').replaceFirst(
			'1234567890987654321', '.')
	}

	/**
	 * Transform a String (package name) into file system compatible path.
	 * e.g. 'org.example.foo' will be transformed into 'com/example/foo'
	 */
	public def String toPath(String packageName) {
		packageName.replace('.', '/')
	}

	/**
	 * Transform a (camelCased) String into lowercase with underscore.
	 * e.g. 'myExampleName' will be transformed into 'my_example_name'
	 */
	public def String toLowerUnderscore(String input) {
		CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input);
	}

	/**
	 * Transform a String (package name) into valid namespace value.
	 * e.g. 'org.example.foo' will be transformed into 'http://www.example.org/foo'
	 */
	public def String toNamespace(String input) {
		val String[] parts = input?.toLowerCase?.split('\\.')
		val String[] lastParts = input?.replaceAll(parts.get(0) + '.', '')?.replaceAll(parts.get(1) + '.', '')?.
			toLowerCase?.split('.')

		'''http://www.«parts.get(1)».«parts.get(0)»«FOR String part : lastParts»/«part»«ENDFOR»'''
	}

	public def String formatted(String description) {
		if (description.nullOrEmpty) {
			return ''
		} else {
			return ''' («description»)'''
		}
	}

	public def String clean(String identifier) {
		return identifier?.replaceAll('[^a-zA-Z0-9]', '')
	}

	public def String filePath(File path, String filename) '''«path»«File.separator»«filename»'''

}

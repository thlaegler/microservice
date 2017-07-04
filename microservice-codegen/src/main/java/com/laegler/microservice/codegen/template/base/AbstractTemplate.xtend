package com.laegler.microservice.codegen.template.base

import com.google.common.base.CaseFormat
import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.ModelAccessor
import com.laegler.microservice.codegen.model.ModelWrapper
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.GregorianCalendar
import java.util.HashMap
import java.util.UUID
import org.eclipse.xtend.lib.annotations.Accessors
import com.laegler.microservice.codegen.model.Project
import com.laegler.microservice.codegen.model.OverwritePolicy
import java.io.File
import com.laegler.microservice.codegen.model.FileHelper
import com.laegler.microservice.model.microserviceModel.MicroserviceModelFactory
import javax.inject.Inject
import com.laegler.microservice.codegen.model.ProjectBuilder

/**
 * Abstract super type for all templates.
 */
abstract class AbstractTemplate {

	@Inject protected ModelAccessor modelAccessor
	@Inject protected MicroserviceModelFactory microserviceModelFactory
	@Inject protected FileHelper fileHelper
	@Inject protected ProjectBuilder projectBuilder
	@Inject protected TemplateBuilder templateBuilder

	@Accessors UUID id
	@Accessors String fileName
	@Accessors FileType fileType
	@Accessors String relativPath
	@Accessors Project project

	@Accessors String header
	@Accessors String content
	@Accessors String footer

	@Accessors HashMap<String, Object> parameters
	@Accessors OverwritePolicy overwritePolicy
	@Accessors String documentation
	@Accessors String version

	@Accessors boolean skipStamping

	/**
	 * Set default preferences for all templates.
	 */
	new(Project project) {
		if(project === null) {
			this.project = projectBuilder.build
		} else {
			this.project = project
		}
		this.id = UUID.randomUUID()
		this.fileName = 'undefined file name'
		this.fileType = FileType.UNDEFINED
		this.relativPath = ''
		this.header = null
		this.content = null
		this.footer = null
		this.parameters = null
		this.overwritePolicy = OverwritePolicy.OVERWRITE
		this.documentation = null
		this.version = this.project?.version
		this.skipStamping = false
	}

	public def ModelWrapper getModel() {
		return modelAccessor.model
	}

	public def String getFullPathWithName() {
		'''«project.directory»/«relativPath»/«fileName».«fileType.extension»'''
	}

	protected def String getTemplateName() {
		this.class.canonicalName
	}

	/**
	 * Assemble file content with header, footer and generation-stamp.
	 */
	public def String getFileContent() {
		if (!header.nullOrEmpty && !footer.nullOrEmpty) {
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
		} else {
			return '''
				«stamp»
				«content»
			'''
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

	protected def String getCurrentDate() {
		val DateFormat sdf = new SimpleDateFormat('dd.MM.yyyy - HH:mm:ss:SS')
		val GregorianCalendar calendar = new GregorianCalendar
		sdf.format(calendar.time)
	}

	/**
	 * Transform a String (version) into Double compatible String.
	 * 
	 * Note: This is so stupid!
	 */
	protected def String getVersionDouble(String version) {
		version.replaceFirst('v', '').replaceFirst('.', '1234567890987654321').replaceAll('\\D', '').replaceFirst(
			'1234567890987654321', '.')
	}

	/**
	 * Transform a String (package name) into file system compatible path.
	 * e.g. 'org.example.foo' will be transformed into 'com/example/foo'
	 */
	protected def String toPath(String packageName) {
		packageName.replace('.', '/')
	}

	/**
	 * Transform a (camelCased) String into lowercase with underscore.
	 * e.g. 'myExampleName' will be transformed into 'my_example_name'
	 */
	protected def String toLowerUnderscore(String input) {
		CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, input);
	}

	/**
	 * Transform a String (package name) into valid namespace value.
	 * e.g. 'org.example.foo' will be transformed into 'http://www.example.org/foo'
	 */
	protected def String toNamespace(String input) {
		val String[] parts = input?.toLowerCase?.split('\\.')
		val String[] lastParts = input?.replaceAll(parts.get(0) + '.', '')?.replaceAll(parts.get(1) + '.', '')?.
			toLowerCase?.split('.')

		'''http://www.«parts.get(1)».«parts.get(0)»«FOR String part : lastParts»/«part»«ENDFOR»'''
	}

	protected def String getFormatted(String description) {
		if (description.nullOrEmpty) {
			return ''
		} else {
			return ''' («description»)'''
		}
	}

	protected def String getClean(String identifier) {
		return identifier?.replaceAll('[^a-zA-Z0-9]', '')
	}

	protected def String getFilePath(File path, String filename) '''«path»«File.separator»«filename»'''

	protected def String getFilePath(Project m, String filename) '''«m.directory»«File.separator»«filename»'''

}

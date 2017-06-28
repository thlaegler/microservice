package com.laegler.microservice.codegen.model;

import java.io.File
//import org.eclipse.core.resources.IFile
//import org.eclipse.core.resources.IProject
//import org.eclipse.core.resources.IWorkspaceRoot
//import org.eclipse.core.resources.ResourcesPlugin
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.charset.StandardCharsets
import org.apache.commons.io.FileUtils
import java.nio.charset.Charset
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.util.Collection
import com.laegler.microservice.codegen.template.base.AbstractTemplate
import com.laegler.microservice.codegen.template.base.BaseTemplate

/**
 * File helpers with convenience methods.
 * 
 * @author Thomas Laegler <thomas.laegler@googlemail.com>
 */
public class FileHelper {

	protected static Logger LOG = LoggerFactory.getLogger(FileHelper)

	/**
	 * Get file with given workspace relative path.
	 */
	def File findFile(String fileLocation1) {
		// Strip unwanted characters
		val String fileLocation = fileLocation1.replaceAll('%22', '').replaceAll('"', '')
		LOG.info('''Searching for file: «fileLocation»''')

//		val IWorkspaceRoot root = ResourcesPlugin.workspace.root
//
//		// Loop over all projects and search given file
//		for (IProject project : root.projects) {
//			log.info('''Searching for file in project «project»''')
//			val IFile file = project.getFile(fileLocation)
//			if (file != null) {
//				log.info('''File found «fileLocation»''')
//				return file.location.toFile
//			}
//		}
		LOG.info('''File not found: «fileLocation»)''')
		null
	}

	public def boolean isNullOrEmpty2(Object object) {
		if (object instanceof Collection) {
			return object != null && !object.empty
		}
		if (object instanceof String) {
			return object != null && !object.empty
		}
		return object != null
	}

	public def String asString(File file) {
		val byte[] encoded = Files.readAllBytes(Paths.get(file.path))
		new String(encoded, StandardCharsets.UTF_8)
	}

	public def boolean toFile2(AbstractTemplate template) {
		LOG.info('''Try to generate file from «template.fullPathWithName»''')

		// Don't overwrite existing files if defined in template
		if (template.overwritePolicy != OverwritePolicy.OVERWRITE) {

			val File file = findFile(template.fullPathWithName)
			if (file != null) {

				// Check if there are file changes
				if (asString(file).equalsIgnoreCase(template.fileContent)) {
					LOG.
						info('''No changes in file so we skip generation and keep the old version for file «template.fullPathWithName»''')
					return false
				}

				// Compare versions
				val String fileVersion = getFileVersion(file)
				val int versionCompare = versionCompare(fileVersion, template.version)
				if (versionCompare > 0) {
					LOG.info('''Version is older than the existing version for file «template.fullPathWithName»''')
					return false
				}
			}
		}

		LOG.info('''Generating file «template.fullPathWithName»''')
//		stubbr.fsa.generateFile('''../«template.fullPathWithName»''', template.fileContent)
		LOG.info('''Successfully generated file «template.fullPathWithName»''')
		true
	}

	public def void toFile(AbstractTemplate template) {
		LOG.debug('''Trying to write file «template.fullPathWithName»''')
		FileUtils.writeStringToFile(
			new File(template.fullPathWithName) => [
				parentFile.mkdirs
				createNewFile
			],
			template.fileContent,
			Charset.defaultCharset()
		)
	}

	public def void toFile(String content, String pathname) {
		LOG.debug('''Trying to write file «pathname»''')
		FileUtils.writeStringToFile(
			new File(pathname) => [
				parentFile.mkdirs
				createNewFile
			],
			content,
			Charset.defaultCharset()
		)
	}

	/**
	 * 
	 */
	public def getFileVersion(File file) {
		val String fileContent = asString(file)
		if (fileContent.contains('{{{Version: ') && fileContent.contains('}}}')) {
			val String version = fileContent.substring(fileContent.indexOf("{{{Version: ") + 1,
				fileContent.indexOf("}}}"))
			return version
		}
		null
	}

	/**
	 * Compare two versions.
	 * 
	 * @return The result is a negative integer if str1 is _numerically_ less than str2. 
	 *         The result is a positive integer if str1 is _numerically_ greater than str2. 
	 *         The result is zero if the strings are _numerically_ equal.
	 */
	public def int versionCompare(String str1, String str2) {
		val String[] vals1 = str1.split("\\.")
		val String[] vals2 = str2.split("\\.")
		var int i = 0

		// set index to first non-equal ordinal or length of shortest version string
		while (i < vals1.length && i < vals2.length && vals1.get(i).equals(vals2.get(i))) {
			i++
		}

		// compare first non-equal ordinal number
		if (i < vals1.length && i < vals2.length) {
			val int diff = Integer.valueOf(vals1.get(i)).compareTo(Integer.valueOf(vals2.get(i)))
			return Integer.signum(diff)
		}

		// the strings are equal or one string is a substring of the other
		// e.g. "1.2.3" = "1.2.3" or "1.2.3" < "1.2.3.4"
		return Integer.signum(vals1.length - vals2.length)
	}

}

package com.laegler.microservice.adapter.util;

import com.laegler.microservice.adapter.model.OverwritePolicy
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import java.io.File
import java.nio.charset.Charset
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Paths
import javax.inject.Singleton
import org.apache.commons.io.FileUtils
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Singleton
public class FileUtil {

	private static final Logger LOG = LoggerFactory.getLogger(FileUtil)

	/**
	 * Get file with given workspace relative path.
	 */
	def File findFile(String fileLocation1) {
		// Strip unwanted characters
		if (fileLocation1 === null) {
			LOG.debug('  Could not find file: ' + fileLocation1)
			return null
		}
		val String fileLocation = fileLocation1?.replaceAll('%22', '')?.replaceAll('"', '')
		LOG.debug('''Searching for file: «fileLocation»''')

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
		LOG.debug('''File not found: «fileLocation»)''')
		null
	}

	public def boolean isNullOrEmpty2(Object object) {
		if (object instanceof Iterable<?>) {
			return object !== null && !object.empty
		}
		if (object instanceof String) {
			return object !== null && !object.empty
		}
		return object !== null
	}

	public def String asString(File file) {
		if (file === null) {
			LOG.debug('file is null')
			return null
		}
		val byte[] encoded = Files.readAllBytes(Paths.get(file.path))
		new String(encoded, StandardCharsets.UTF_8)
	}

	public def void toFile(Template template) {
		if (template.canOverwrite) {
			FileUtils.writeStringToFile(
				new File(template.fullPathWithName),
				template.fileContent,
				Charset.defaultCharset()
			)
		}
	}

	public def void toFile(Template template, Project p) {
		if (template.canOverwrite) {
			FileUtils.writeStringToFile(
				new File(p.directory + '/' + template.fullPathWithName),
				template.fileContent,
				Charset.defaultCharset()
			)
		}
	}

	public def void toFile(String content, String pathname) {
		FileUtils.writeStringToFile(
			new File(pathname),
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

	public def boolean canOverwrite(Template template) {
		// Don't overwrite existing files if defined in template
		if (template.overwritePolicy != OverwritePolicy.OVERWRITE) {
			val File file = findFile(template.fullPathWithName)
			if (file !== null) {
				// Check if there are file changes
				if (asString(file).equalsIgnoreCase(template.fileContent)) {
					LOG.
						info('''No changes in file so we skip generation and keep the old version for file «template.fullPathWithName»''')
					return false
				}
				// Compare versions
				val String fileVersion = getFileVersion(file)
				val int versionCompare = compareVersion(fileVersion, template.version)
				if (versionCompare > 0) {
					LOG.debug('''Version is older than the existing version for file «template.fullPathWithName»''')
					return false
				}
			}
		}
		return true
	}

	/**
	 * Compare two versions.
	 * 
	 * @return The result is a negative integer if str1 is _numerically_ less than str2. 
	 *         The result is a positive integer if str1 is _numerically_ greater than str2. 
	 *         The result is zero if the strings are _numerically_ equal.
	 */
	public def int compareVersion(String v1, String v2) {
		val String[] vals1 = v1.split("\\.")
		val String[] vals2 = v2.split("\\.")
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

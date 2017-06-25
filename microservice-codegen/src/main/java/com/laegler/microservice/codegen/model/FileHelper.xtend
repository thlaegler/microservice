package com.laegler.microservice.codegen.model;

import com.google.inject.Inject
import java.io.File
import java.util.logging.Logger
//import org.eclipse.core.resources.IFile
//import org.eclipse.core.resources.IProject
//import org.eclipse.core.resources.IWorkspaceRoot
//import org.eclipse.core.resources.ResourcesPlugin
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.charset.StandardCharsets

/**
 * File helpers with convenience methods.
 * 
 * @author Thomas Laegler <thomas.laegler@googlemail.com>
 */
public class FileHelper {

	@Inject Logger log

	/**
	 * Get file with given workspace relative path.
	 */
	def File findFile(String fileLocation1) {
		// Strip unwanted characters
		val String fileLocation = fileLocation1.replaceAll('%22', '').replaceAll('"', '')
		log.info('''Searching for file: «fileLocation»''')
		
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

		log.info('''File not found: «fileLocation»)''')
		null
	}

	/**
	 * 
	 */
	public def String getFileContent(File file) {
		val byte[] encoded = Files.readAllBytes(Paths.get(file.path))
		new String(encoded, StandardCharsets.UTF_8)
	}

	/**
	 * 
	 */
	public def getFileVersion(File file) {
		val String fileContent = getFileContent(file)
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

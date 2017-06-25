package templates._common.src_main_resource.meta_inf

import com.laegler.stubbr.lang.genmodel.FileType
import com.laegler.stubbr.lang.genmodel.Project
import templates.AbstractTemplate
import com.laegler.stubbr.lang.generator.repository.StubbrRegistry

/**
 * File Generator for OSGi Manifest descriptor (MANIFEST.MF)
 */
class ManifestMfTemplateBase extends AbstractTemplate {

	/**
	 * 
	 */
	new(StubbrRegistry stubbr, Project project) {
		super(stubbr, project)
		fileType = FileType.MANIFEST
		fileName = 'MANIFEST'
		relativPath = '/src/main/resource/META-INF/'
		documentation = 'OSGi Manifest descriptor'

		content = template
	}

	private def String getTemplate() '''
		Manifest-Version: 1.0
		Class-Path: 
		
	'''

}

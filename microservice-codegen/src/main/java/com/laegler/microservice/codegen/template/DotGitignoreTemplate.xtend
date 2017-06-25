package com.laegler.microservice.codegen.template.utils

import com.laegler.microservice.codegen.model.FileType
import com.laegler.microservice.codegen.model.Project

/**
 * File template for git ignore file
 */
abstract class DotGitignoreTemplate extends AbstractDotGitignoreTemplate {

	new(Project project) {
		super(project)
		fileType = FileType.GITIGNORE
		fileName = ''
		relativPath = '/'
		documentation = 'Git ignore file'

		content = template
	}

	private def String getTemplate() '''
		# Compiled source #
		###################
		*.com
		*.class
		*.dll
		*.exe
		*.o
		*.so
		*.xtendbin
		
		# Packages #
		############
		# it's better to unpack these files and commit the raw source
		# git has its own built in compression methods
		*.7z
		*.dmg
		*.gz
		*.iso
		*.jar
		*.war
		*.ear
		*.rar
		*.tar
		*.zip
		
		# Logs and databases #
		######################
		*.log
		# *.sql
		*.sqlite
		
		# OS generated files #
		######################
		.DS_Store
		.DS_Store?
		._*
		.Spotlight-V100
		.Trashes
		ehthumbs.db
		Thumbs.db
		.*~
		
		# Folder
		bin/
		target/
	'''

}

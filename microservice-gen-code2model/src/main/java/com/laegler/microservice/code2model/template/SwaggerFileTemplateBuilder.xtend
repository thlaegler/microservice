package com.laegler.microservice.code2model.template

import com.laegler.microservice.adapter.model.FileType
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import javax.inject.Named

/**
 * File template for git ignore file
 */
@Named
class SwaggerFileTemplateBuilder extends TemplateBuilder {

	public def Template getTemplate(Project project) {
		templateBuilder.fileName('').fileType(FileType.GITIGNORE).documentation('Git ignore file').relativPath(
			namingStrategy.basePath).project(project).content(content).build
	}

	private def String getContent() '''
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

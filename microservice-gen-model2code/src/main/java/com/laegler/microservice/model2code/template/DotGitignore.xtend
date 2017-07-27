package com.laegler.microservice.model2code.template

import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.TemplateBuilder
import com.laegler.microservice.adapter.model.Project
import javax.inject.Named
import com.laegler.microservice.adapter.model.FileType
import javax.inject.Inject
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.model.World

@Named
class DotGitignore {

	@Inject protected World world
	@Inject protected TemplateBuilder templateBuilder
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		templateBuilder //
		.project(project) //
		.fileName('') //
		.fileType(FileType.GITIGNORE) //
		.relativPath('/') //
		.documentation('Git ignore file') //
		.skipStamping(true) //
		.content('''
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
		''') //
		.build
	}

}

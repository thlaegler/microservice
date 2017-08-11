package com.laegler.microservice.model2code.template.gateway

import javax.inject.Named
import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.Project

import com.laegler.microservice.adapter.model.FileType
import javax.inject.Inject
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.model.World

@Named
class GatewayEclipseDotProject {

	protected static final Logger LOG = LoggerFactory.getLogger(GatewayEclipseDotProject)

	@Inject protected World world
	
	@Inject protected NamingStrategy namingStrategy

	public def Template getTemplate(Project project) {
		Template::builder //
		.project(project) //
		.fileName('') //
		.fileType(FileType.ECLIPSE_PROJECT) //
		.relativPath('/') //
		.documentation('Eclipse project file') //
		.skipStamping(true) //
		.header('''
			<?xml version="1.0" encoding="UTF-8"?>
			<projectDescription>
		''') //
		.footer('<projectDescription>') //
		.content('''
			<name>«project.name»</name>
			<comment>«project.documentation»</comment>
			<projects>
			</projects>
			<buildSpec>
				<buildCommand>
					<name>org.eclipse.xtext.ui.shared.xtextBuilder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.eclipse.wst.common.project.facet.core.builder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.eclipse.jdt.core.javabuilder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.jboss.tools.cdi.core.cdibuilder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.eclipse.wst.validation.validationbuilder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.eclipse.m2e.core.maven2Builder</name>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.hibernate.eclipse.console.hibernateBuilder</name>
					<arguments>
					</arguments>
				</buildCommand>
			</buildSpec>
			<natures>
				<nature>org.eclipse.wst.common.modulecore.ModuleCoreNature</nature>
				<nature>org.eclipse.jdt.core.javanature</nature>
				<nature>org.eclipse.m2e.core.maven2Nature</nature>
				<nature>org.eclipse.wst.common.project.facet.core.nature</nature>
				<nature>org.jboss.tools.cdi.core.cdinature</nature>
				<nature>org.eclipse.xtext.ui.shared.xtextNature</nature>
				<nature>org.hibernate.eclipse.console.hibernateNature</nature>
			</natures>
		''').build
	}

}

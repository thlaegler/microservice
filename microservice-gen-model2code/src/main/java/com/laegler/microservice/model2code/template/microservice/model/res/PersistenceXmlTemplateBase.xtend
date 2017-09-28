//package com.laegler.microservice.model2code.template.microservice.resource
//
//import com.laegler.microservice.model2code.template.base.AbstractXmlTemplate
//import com.laegler.microservice.adapter.util.Project
//
///**
// * File Generator for JPA descriptor (persistence.xml)
// */
//class PersistenceXmlTemplateBase extends AbstractXmlTemplate {
//
//	new(Project m) {
//		super(m)
//		fileName = 'persistence'
//		relativPath = '/src/main/resource/META-INF/'
//		header = '''
//			<?xml version="1.0" encoding="UTF-8"?>
//			<persistence
//				version="2.1"
//				xmlns="http://xmlns.jcp.org/xml/ns/persistence"
//				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
//				xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence
//					http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
//		'''
//		footer = '</persistence>'
//		documentation = 'JPA descriptor'
//
//		content = template
//	}
//
//	private def String getTemplate() '''
//«««		«FOR Level1Attribute persistenceUnit : stubbr?.stubb?.persistence?.persistenceUnits»
//«««			<persistence-unit name="«persistenceUnit?.name»" transaction-type="JTA">
//«««				<jta-data-source>java:jboss/datasources/«stubbr?.stubb?.persistence?.datasources?.get(0)?.name»</jta-data-source>
//«««				<properties>
//«««					<property name="hibernate.show_sql" value="true" />
//«««					<property name="hibernate.format_sql" value="true" />
//«««					<property name="hibernate.hbm2ddl.auto" value="validate" />
//«««					<!-- <property name="hibernate.hbm2ddl.auto" value="create-drop" /> -->
//«««					         <!-- <property name="hibernate.hbm2ddl.import_files" value="import.sql" /> -->
//«««					<property name="hibernate.dialect"
//«««						value="de.citysquire.model.database.«stubbr?.stubb?.prefix»«stubbr?.stubb?.persistence?.databases?.get(0)?.type.literal»5InnoDBDialect" />
//«««					<property name="jadira.usertype.autoRegisterUserTypes"
//«««						value="true" />
//«««				</properties>
//«««			</persistence-unit>
//«««		«ENDFOR»
//	'''
//
//}

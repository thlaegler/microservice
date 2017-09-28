package com.laegler.microservice.adapter.model

import com.laegler.microservice.adapter.model.FileType
import javax.annotation.PostConstruct
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.GregorianCalendar
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.util.NamingStrategy
import javax.inject.Inject

abstract class Java {

	protected static final Logger LOG = LoggerFactory.getLogger(Java)

	@Inject protected World world
	@Inject private NamingStrategy _name

	public def Template.Builder getTemplateBuilder() {
		return Template::builder //
		.fileType(FileType.JAVA) //
		.documentation('Java file') //
		.skipStamping(false) //
	}

	/**
	 * Template part for type-specific javadoc.
	 */
	protected def String getJavaDocType(Project project) '''
		import org.slf4j.Logger;
		import org.slf4j.LoggerFactory;
		import javax.annotation.Generated;
		import com.google.gson.annotations.Until;
		import com.google.gson.annotations.Since;
		
		/**
		 * «project.documentation»
		 * 
		 * @author «world.author?.replaceAll('"','')» {@literal <«world.author»[at]«world.name»>}
		 * @since «project.version»
		 * @version «project.version»
		 * @generated «currentDate»
		 */
		@Since(0.1)
		//@Until(0.0)
		@Generated(value = '«»')
	'''

	/**
	 * Template part for method-specific javadoc.
	 */
	protected def String getJavaDocMethod(Project project) '''
		/**
		 * «project.documentation»
		 * 
		 * @author «world.author?.replaceAll('"','')» {@literal <«world.author»[at]«world.name»>}
		 * @since «project.version»
		 * @version «project.version»
		 * @generated «currentDate»
		 */
		//@Since(«project.version»)
		@Until(0.0)
	'''

	protected def String getCurrentDate() {
		val DateFormat sdf = new SimpleDateFormat('dd.MM.yyyy - HH:mm:ss:SS')
		val GregorianCalendar calendar = new GregorianCalendar
		sdf.format(calendar.time)
	}

}

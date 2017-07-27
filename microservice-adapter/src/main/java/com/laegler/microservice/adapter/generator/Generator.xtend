package com.laegler.microservice.adapter.generator

import com.laegler.microservice.model.Architecture
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import javax.inject.Inject
import java.util.GregorianCalendar
import java.io.StringWriter
import javax.xml.bind.JAXBContext
import javax.xml.bind.Marshaller
import javax.xml.bind.JAXBElement
import com.laegler.microservice.adapter.model.Project
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.model.ProjectBuilder
import com.laegler.microservice.adapter.util.FileUtil
import com.laegler.microservice.adapter.model.TemplateBuilder
import java.util.List

abstract class Generator {

	protected static final Logger LOG = LoggerFactory.getLogger(Generator)

	@Inject protected World world
	@Inject protected FileUtil fileHelper
	@Inject protected NamingStrategy namingStrategy
	@Inject protected ProjectBuilder projectBuilder
	@Inject protected TemplateBuilder templateBuilder

	abstract public def List<Project> generate(Architecture a)

	protected def getParentDir() '''../'''

	/**
	 * If the label is not set we'd like to use the name as label
	 * in the generation step.
	 */
	protected def String getLabelOrName() {
		return world?.name
	}

	protected def String getDate() '''«GregorianCalendar.instance.toString»'''

	protected def String getVersion(String version) '''«version.replaceFirst('v','')»'''

	protected def String getVersionDouble(
		String version) '''«version.replaceFirst('v','').replaceFirst('.','1234567890987654321').replaceAll('\\D', '').replaceFirst('1234567890987654321', '.')»'''

	protected def <T> String marshal(JAXBElement<T> model, Class<T> clazz) {
		val StringWriter writer = new StringWriter
		val JAXBContext context = JAXBContext.newInstance(clazz)

		val Marshaller marshaller = context.createMarshaller
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        marshaller.setProperty(Marshaller.JAXB_SCHEMA_LOCATION, "http://www.mysite.com/abc.xsd");
		marshaller.marshal(model, writer)

//		marshaller.marshal(jaxbElement, NoNamespaceWriter.filter(writer))
//		val JAXBElement<T> jaxbElement = new JAXBElement(new QName(clazz.simpleName.toFirstLower), clazz, model)
//		marshaller.marshal(jaxbElement, writer)
//		val JAXBSource source = new JAXBSource(context, jaxbElement)
		return writer.toString
	}

	protected def String toPath(String packageName) {
		packageName.replace('.', '/')
	}
}

package com.laegler.microservice.codegen.generator

import java.io.StringWriter
import java.util.GregorianCalendar
import javax.xml.bind.JAXBContext
import javax.xml.bind.JAXBElement
import javax.xml.bind.Marshaller
import com.laegler.microservice.codegen.model.ModelWrapper

abstract class AbstractGenerator {

	protected def getParentDir() '''../'''

	/**
	 * If the label is not set we'd like to use the name as label
	 * in the generation step.
	 */
	protected def String getLabelOrName(ModelWrapper model) {
		return model?.name
	}

	protected def String getDate() '''«GregorianCalendar.instance.toString»'''
	
	protected def String getVersion(String version) '''«version.replaceFirst('v','')»'''
	
	protected def String getVersionDouble(String version) '''«version.replaceFirst('v','').replaceFirst('.','1234567890987654321').replaceAll('\\D', '').replaceFirst('1234567890987654321', '.')»'''
	
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

//	protected def String generateStakeholdersPart(Stubb stubb)
//	protected def String generateArtifactsPart(Stubb stubb)
//	protected def String generateManagementsPart(Stubb stubb)
}

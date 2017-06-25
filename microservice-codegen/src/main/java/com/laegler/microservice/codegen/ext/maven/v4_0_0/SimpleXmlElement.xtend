package com.laegler.microservice.codegen.ext.maven.v4_0_0

import javax.xml.bind.JAXBElement
import javax.xml.bind.annotation.XmlAccessType
import javax.xml.bind.annotation.XmlAccessorType
import javax.xml.bind.annotation.XmlType
import javax.xml.namespace.QName

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="SimpleElement")
class SimpleXmlElement extends JAXBElement<String> {

	new(String name, String value) {
		super(new QName(null, name), String, value)
	}
	
	new(QName name, Class<String> declaredType, String value) {
		super(name, declaredType, value)
	}

	new(QName name, Class<String> declaredType, Class scope, String value) {
		super(name, declaredType, scope, value)
	}
}

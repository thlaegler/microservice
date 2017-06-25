package com.laegler.microservice.codegen.model;

import java.io.Writer;
import java.util.Iterator;

import javax.xml.namespace.NamespaceContext;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;

public class NoNamespaceWriter extends DelegatingXMLStreamWriter {

	private static final NamespaceContext emptyNamespaceContext = new NamespaceContext() {

//		@Override
		public String getNamespaceURI(String prefix) {
			return "";
		}

//		@Override
		public String getPrefix(String namespaceURI) {
			return "";
		}

//		@Override
		public Iterator getPrefixes(String namespaceURI) {
			return null;
		}

	};

	public static XMLStreamWriter filter(Writer writer) throws XMLStreamException {
		return new NoNamespaceWriter(XMLOutputFactory.newInstance().createXMLStreamWriter(writer));
	}

	public NoNamespaceWriter(XMLStreamWriter writer) {
		super(writer);
	}

	@Override
	public NamespaceContext getNamespaceContext() {
		return emptyNamespaceContext;
	}

}
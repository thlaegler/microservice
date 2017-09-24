package org.example.users.soap.client;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.ws.client.core.WebServiceTemplate;

abstract public class AbstractUsersSoapClientConfig {

	@Value("${org.example.users.host}")
	private String host;

	@Value("${org.example.users.soapPort}")
	private int port;

	protected Jaxb2Marshaller jaxb2Marshaller() {
		Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
		marshaller.setContextPath("org.example.users.soap");
		return marshaller;
	}

	protected WebServiceTemplate webServiceTemplate() {
		WebServiceTemplate wsTemplate = new WebServiceTemplate();
		wsTemplate.setMarshaller(jaxb2Marshaller());
		wsTemplate.setUnmarshaller(jaxb2Marshaller());
		wsTemplate.setDefaultUri("http://" + host + ":" + port + "/ws/users");
		return wsTemplate;
	}
}

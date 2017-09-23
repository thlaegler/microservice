package org.example.users.soap.client

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.oxm.jaxb.Jaxb2Marshaller
import org.springframework.ws.client.core.WebServiceTemplate

@Configuration
public class UsersSoapClientConfig {

	@Value('${org.example.users.host}')
	private String host

	@Value('${org.example.users.soapPort}')
	private int port

	@Bean
	public def Jaxb2Marshaller jaxb2Marshaller() {
		val Jaxb2Marshaller it = new Jaxb2Marshaller
		it.setContextPath('org.example.users.soap')
		it
	}

	@Bean
	public def WebServiceTemplate webServiceTemplate() {
		val WebServiceTemplate it = new WebServiceTemplate
		it.setMarshaller(jaxb2Marshaller)
		it.setUnmarshaller(jaxb2Marshaller)
		it.setDefaultUri('http://' + host + ':' + port + '/ws/users')
		it
	}
}

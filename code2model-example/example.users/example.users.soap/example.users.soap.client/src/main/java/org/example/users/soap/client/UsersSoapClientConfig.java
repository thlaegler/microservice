package org.example.users.soap.client;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.ws.client.core.WebServiceTemplate;

@Configuration
public class UsersSoapClientConfig extends AbstractUsersSoapClientConfig {

	@Bean
	@Override
	public Jaxb2Marshaller jaxb2Marshaller() {
		return super.jaxb2Marshaller();
	}

	@Bean
	@Override
	public WebServiceTemplate webServiceTemplate() {
		return super.webServiceTemplate();
	}
}

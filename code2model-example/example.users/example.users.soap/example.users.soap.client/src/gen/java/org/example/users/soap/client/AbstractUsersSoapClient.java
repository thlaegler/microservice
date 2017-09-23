package org.example.users.soap.client;

import org.example.types.users.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

abstract public class AbstractUsersSoapClient extends WebServiceGatewaySupport {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersSoapClient.class);
	private static final String BASE_URI = "http://www.example.org/ws/users/";

	@Autowired
	protected WebServiceTemplate wsTemplate;

	protected User addUser(User u) {
		LOG.trace("addUser({}) called", u.getUsername());

		return ((User) wsTemplate.marshalSendAndReceive(u, new SoapActionCallback(BASE_URI + "addUser")));
	}
}

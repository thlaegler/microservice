package org.example.users.soap.client

import org.example.user.model.entity.User
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.ws.client.core.WebServiceTemplate
import org.springframework.ws.client.core.support.WebServiceGatewaySupport
import org.springframework.ws.soap.client.core.SoapActionCallback

@Component
class UsersSoapClient extends WebServiceGatewaySupport {

	private static final Logger LOG = LoggerFactory.getLogger(UsersSoapClient)

	@Autowired
	private WebServiceTemplate webServiceTemplate

	public def User addUser(User user) {
		webServiceTemplate.marshalSendAndReceive(user,
			new SoapActionCallback("http://www.example.org/ws/users/addUser")) as User
	}
}

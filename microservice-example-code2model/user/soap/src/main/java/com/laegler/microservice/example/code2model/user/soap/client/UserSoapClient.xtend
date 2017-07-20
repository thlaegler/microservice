package com.laegler.microservice.example.code2model.user.soap.client

import javax.inject.Inject
import org.slf4j.Logger
import com.laegler.microservice.example.code2model.user.soap.GetUserResponse
import com.laegler.microservice.example.code2model.user.soap.GetUserRequest

class UserSoapClient extends WebServiceGatewaySupport {

	@Inject Logger LOG

	public def GetUserResponse getUser(String ticker) {

		val GetUserRequest request = new GetUserRequest
		request.setSymbol(ticker);

		LOG.info("Requesting quote for " + ticker)

		val GetUserResponse response = getWebServiceTemplate().marshalSendAndReceive(
			"http://www.webservicex.com/stockquote.asmx", request,
			new SoapActionCallback("http://www.webserviceX.NET/GetUser"));

		response
	}
}

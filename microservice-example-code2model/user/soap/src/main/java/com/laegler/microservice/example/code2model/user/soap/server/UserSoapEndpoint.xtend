package com.laegler.microservice.example.code2model.user.soap.server

import org.springframework.ws.server.endpoint.annotation.ResponsePayload
import org.springframework.ws.server.endpoint.annotation.RequestPayload
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.ws.server.endpoint.annotation.Endpoint
import com.laegler.microservice.example.code2model.user.business.UserService
import com.laegler.microservice.example.code2model.user.soap.GetUserResponse
import com.laegler.microservice.example.code2model.user.soap.GetUserRequest
import org.springframework.ws.server.endpoint.annotation.PayloadRoot

@Endpoint
public class UserSoapEndpoint {
	
	private static final String NAMESPACE_URI = "http://www.laegler.com/microservice/example/code2model/user/soap";

	@Autowired
	UserService service;

	@PayloadRoot(namespace=NAMESPACE_URI, localPart="getUserRequest")
	@ResponsePayload
	public def GetUserResponse getUser(@RequestPayload GetUserRequest request) {
		val GetUserResponse response = new GetUserResponse
		response.setUser(service.getUserById(request.id))
		response
	}
}

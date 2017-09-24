package org.example.users.soap.server;

import org.example.types.users.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

import java.util.List;

@Endpoint
public class UsersSoapEndpoint extends AbstractUsersSoapEndpoint {

	private static final Logger LOG = LoggerFactory.getLogger(UsersSoapEndpoint.class);
	private static final String NAMESPACE_URI = "http://www.example.org/types/users";

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "addUser")
	@ResponsePayload
	public User addUserWS(@RequestPayload User user) {
		LOG.trace("addUser({}) called", user.getUsername());

		return super.addUser(user);
	}

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "updateUser")
	@ResponsePayload
	public User updateUserWS(@RequestPayload User user) {
		LOG.trace("updateUser({}) called", user.getUsername());

		return super.updateUser(user);
	}

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "deleteUser")
	@ResponsePayload
	public void deleteUserWS(@RequestPayload long id) {
		LOG.trace("deleteUser({}) called", id);

		super.deleteUser(id);
	}

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "getUserById")
	@ResponsePayload
	public User getUserByIdWS(@RequestPayload long id) {
		LOG.trace("getUserById({}) called", id);

		return super.getUserById(id);
	}

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "getUserByUsername")
	@ResponsePayload
	public User getUserByUsernameWS(@RequestPayload String username) {
		LOG.trace("getUserByUsername({}) called", username);

		return super.getUserByUsername(username);
	}

	@PayloadRoot(namespace = NAMESPACE_URI, localPart = "getAllUsers")
	@ResponsePayload
	public List<User> getAllUsersWS() {
		LOG.trace("getAllUsers() called");

		return super.getAllUsers();
	}
}

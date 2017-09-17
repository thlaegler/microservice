package org.example.users.soap.server

import org.example.types.users.User
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.ws.server.endpoint.annotation.Endpoint
import org.springframework.ws.server.endpoint.annotation.PayloadRoot
import org.springframework.ws.server.endpoint.annotation.RequestPayload
import org.springframework.ws.server.endpoint.annotation.ResponsePayload
import java.util.List

@Endpoint
public class UsersSoapEndpoint extends AbstractUsersSoapEndpoint {

	private static final Logger LOG = LoggerFactory.getLogger(UsersSoapEndpoint)
	private static final String NAMESPACE_URI = 'http://www.example.org/types/users'

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='addUser')
	@ResponsePayload
	override User addUser(@RequestPayload User user) {
		LOG.trace('addUser({}) called', user.username)

		super.addUser(user)
	}

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='updateUser')
	@ResponsePayload
	override User updateUser(@RequestPayload User user) {
		LOG.trace('updateUser({}) called', user.username)

		super.updateUser(user)
	}

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='deleteUser')
	@ResponsePayload
	override void deleteUser(@RequestPayload long id) {
		LOG.trace('deleteUser({}) called', id)

		super.deleteUser(id)
	}

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='getUserById')
	@ResponsePayload
	override User getUserById(@RequestPayload long id) {
		LOG.trace('getUserById({}) called', id)

		super.getUserById(id)
	}

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='getUserByUsername')
	@ResponsePayload
	override User getUserByUsername(@RequestPayload String username) {
		LOG.trace('getUserByUsername({}) called', username)

		super.getUserByUsername(username)
	}

	@PayloadRoot(namespace=NAMESPACE_URI, localPart='getAllUsers')
	@ResponsePayload
	override List<User> getAllUsers() {
		LOG.trace('getAllUsers() called')

		super.getAllUsers()
	}
}

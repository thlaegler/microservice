package org.example.users.soap.server

import java.util.List
import org.example.types.users.User
import org.example.users.business.UsersService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.example.users.soap.UsersSoapModelConverter

public class AbstractUsersSoapEndpoint {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersSoapEndpoint)

	@Autowired
	private UsersSoapModelConverter convert;

	@Autowired
	protected UsersService service

	def User addUser(User u) {
		LOG.trace('addUser({}) called', u.username)

		convert.toSoapModel(service.addUser(convert.toEntityModel(u)))
	}

	def User updateUser(User u) {
		LOG.trace('updateUser({}) called', u.username)

		convert.toSoapModel(service.updateUser(convert.toEntityModel(u)))
	}

	def void deleteUser(long id) {
		LOG.trace('deleteUser({}) called', id)

		service.deleteUser(id)
	}

	def User getUserById(long id) {
		LOG.trace('getUserById({}) called', id)

		convert.toSoapModel(service.getUserById(id))
	}

	def User getUserByUsername(String username) {
		LOG.trace('getUserByUsername({}) called', username)

		convert.toSoapModel(service.getUserByUsername(username))
	}

	def List<User> getAllUsers() {
		LOG.trace('getAllUsers() called')

		convert.toSoapModel(service.getAllUsers())
	}

}

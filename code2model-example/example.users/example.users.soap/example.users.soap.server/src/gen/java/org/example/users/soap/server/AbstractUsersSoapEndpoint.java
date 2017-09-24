package org.example.users.soap.server;

import org.example.types.users.User;
import org.example.users.business.UsersService;
import org.example.users.soap.UsersSoapModelConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

abstract public class AbstractUsersSoapEndpoint {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersSoapEndpoint.class);

	@Autowired
	private UsersSoapModelConverter convert;

	@Autowired
	protected UsersService service;

	protected User addUser(User u) {
		LOG.trace("addUser({}) called", u.getUsername());

		return convert.toSoapModel(service.addUser(convert.toEntityModel(u)));
	}

	protected User updateUser(User u) {
		LOG.trace("updateUser({}) called", u.getUsername());

		return convert.toSoapModel(service.updateUser(convert.toEntityModel(u)));
	}

	protected void deleteUser(long id) {
		LOG.trace("deleteUser({}) called", id);

		service.deleteUser(id);
	}

	protected User getUserById(long id) {
		LOG.trace("getUserById({}) called", id);

		return convert.toSoapModel(service.getUserById(id));
	}

	protected User getUserByUsername(String username) {
		LOG.trace("getUserByUsername({}) called", username);

		return convert.toSoapModel(service.getUserByUsername(username));
	}

	protected List<User> getAllUsers() {
		LOG.trace("getAllUsers() called");

		return convert.toSoapModel(service.getAllUsers());
	}

}

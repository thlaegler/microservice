package org.example.users.rest;

import org.example.users.business.UsersService;
import org.example.users.rest.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

abstract public class AbstractUsersRest {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersRest.class);

	@Autowired
	protected UsersService service;

	@Autowired
	protected UsersRestModelConverter convert;

	protected User addUser(User u) {
		LOG.trace("addUser({}) called", u.getUsername());

		return convert.toRestModel(service.addUser(convert.toEntityModel(u)));
	}

	protected User updateUser(User u) {
		LOG.trace("updateUser({}) called", u.getUsername());

		return convert.toRestModel(service.updateUser(convert.toEntityModel(u)));
	}

	protected void deleteUser(long id) {
		LOG.trace("removeUser({}) called", id);

		service.deleteUser(id);
	}

	protected User getUserById(long id) {
		LOG.trace("userByIdGet({}) called", id);

		return convert.toRestModel(service.getUserById(id));
	}

	protected User getUserByUsername(String username) {
		LOG.trace("getUserByUsername({}) called", username);

		return convert.toRestModel(service.getUserByUsername(username));
	}

	protected List<User> getAllUsers() {
		LOG.trace("allUsersGet({}) called");

		return convert.toRestModel(service.getAllUsers());
	}

}

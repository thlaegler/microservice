package org.example.users.rest

import java.util.List
import org.example.users.business.UsersService
import org.example.users.rest.model.User
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*

abstract class AbstractUsersRest {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersRest)

	@Autowired
	protected UsersService service;

	@Autowired
	protected UsersRestModelConverter convert;

	protected def ResponseEntity<?> addUser(User u) {
		LOG.trace('addUser({}) called', u.username)

		// Call service and translate entity to RESTful model
		val User user = convert.toRestModel(service.addUser(convert.toEntityModel(u)))

		// HATEOAS self link
		user.add(linkTo(methodOn(UsersRest).getUserById(user.userId)).withSelfRel)

		// HATEOAS list links
		user.add(linkTo(methodOn(UsersRest).allUsers).withRel('list'))

		// Send response
		ResponseEntity.ok(user)
	}

	protected def ResponseEntity<?> updateUser(User u) {
		LOG.trace('updateUser({}) called', u.username)

		// Call service and translate entity to RESTful model
		val User user = convert.toRestModel(service.updateUser(convert.toEntityModel(u)))

		// HATEOAS self link
		user.add(linkTo(methodOn(UsersRest).getUserById(user.userId)).withSelfRel)

		// HATEOAS list links
		user.add(linkTo(methodOn(UsersRest).allUsers).withRel('list'))

		// Send response
		ResponseEntity.ok(user)
	}

	protected def ResponseEntity<?> deleteUser(long id) {
		LOG.trace('removeUser({}) called', id)

		// Call service and translate entity to RESTful model
		service.deleteUser(id)

		// Send response
		ResponseEntity.noContent().build
	}

	protected def ResponseEntity<?> getUserById(long id) {
		LOG.trace('userByIdGet({}) called', id)

		// Call service and translate entity to RESTful model
		val User user = convert.toRestModel(service.getUserById(id))

		// HATEOAS self link
		user.add(linkTo(methodOn(UsersRest).getUserById(user.userId)).withSelfRel)

		// HATEOAS list links
		user.add(linkTo(methodOn(UsersRest).allUsers).withRel('list'))

		// Send response
		ResponseEntity.ok(user)
	}

	protected def ResponseEntity<?> getUserByUsername(String username) {
		LOG.trace('getUserByUsername({}) called', username)

		// Call service and translate entity to RESTful model
		val User user = convert.toRestModel(service.getUserByUsername(username))

		// HATEOAS self link
		user.add(linkTo(methodOn(UsersRest).getUserByUsername(user.username)).withSelfRel)

		// HATEOAS list links
		user.add(linkTo(methodOn(UsersRest).allUsers).withRel('list'))

		// Send response
		ResponseEntity.ok(user)
	}

	protected def ResponseEntity<?> getAllUsers() {
		LOG.trace('allUsersGet({}) called')

		// Call service and translate entity to RESTful model
		val List<User> users = convert.toRestModel(service.getAllUsers())
		
		// HATEOAS list links
//		users.add(linkTo(methodOn(UsersRest).allUsers).withRel('list'))

		// Send response
		ResponseEntity.ok(users)
	}

}

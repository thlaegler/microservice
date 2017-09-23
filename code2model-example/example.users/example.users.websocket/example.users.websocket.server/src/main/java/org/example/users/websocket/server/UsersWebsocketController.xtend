package org.example.users.websocket.server

import org.springframework.stereotype.Controller
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.beans.factory.annotation.Autowired
import org.example.users.business.UsersService
import org.example.users.model.entity.User
import org.springframework.messaging.handler.annotation.DestinationVariable
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import java.util.List

@Controller
class UsersWebsocketController extends AbstractUsersWebsocketController {

	private static final Logger LOG = LoggerFactory.getLogger(UsersWebsocketController)

	@Autowired
	private UsersService usersService

	@MessageMapping('/addUser')
	@SendTo('/topic/users')
	public def User addUser(User user) {
		LOG.trace('addUser({}) called', user.username)

		usersService.addUser(user)
	}

	@MessageMapping('/updateUser/{id}')
	@SendTo('/topic/users')
	public def User updateUser(@DestinationVariable long id, User user) {
		LOG.trace('updateUser({}) called', user.username)

		usersService.updateUser(user)
	}

	@MessageMapping('/deleteUser/{id}')
	@SendTo('/topic/users')
	public def void deleteUser(@DestinationVariable long id) {
		LOG.trace('deleteUser({}) called', id)

		usersService.removeUser(id)
	}

	@MessageMapping('/getUserById/{id}')
	@SendTo('/topic/users')
	public def User getUserById(@DestinationVariable long id) {
		LOG.trace('getUserById({}) called', id)

		usersService.getUserById(id)
	}

	@MessageMapping('/getAllUsers')
	@SendTo('/topic/users')
	public def List<User> getAllUsers() {
		LOG.trace('getAllUsers() called')

		usersService.getAllUsers()
	}

}

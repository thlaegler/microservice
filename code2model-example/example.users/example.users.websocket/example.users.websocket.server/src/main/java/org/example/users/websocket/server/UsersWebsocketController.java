package org.example.users.websocket.server;

import org.example.users.business.UsersService;
import org.example.users.model.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class UsersWebsocketController extends AbstractUsersWebsocketController {

	private static final Logger LOG = LoggerFactory.getLogger(UsersWebsocketController.class);

	@Autowired
	private UsersService usersService;

	@MessageMapping("/addUser")
	@SendTo("/topic/users")
	public User addUser(User user) {
		LOG.trace("addUser({}) called", user.getUsername());

		return usersService.addUser(user);
	}

	@MessageMapping("/updateUser/{id}")
	@SendTo("/topic/users")
	public User updateUser(@DestinationVariable long id, User user) {
		LOG.trace("updateUser({}) called", user.getUsername());

		return usersService.updateUser(user);
	}

	@MessageMapping("/deleteUser/{id}")
	@SendTo("/topic/users")
	public void deleteUser(@DestinationVariable long id) {
		LOG.trace("deleteUser({}) called", id);

		usersService.deleteUser(id);
	}

	@MessageMapping("/getUserById/{id}")
	@SendTo("/topic/users")
	public User getUserById(@DestinationVariable long id) {
		LOG.trace("getUserById({}) called", id);

		return usersService.getUserById(id);
	}

	@MessageMapping("/getAllUsers")
	@SendTo("/topic/users")
	public List<User> getAllUsers() {
		LOG.trace("getAllUsers() called");

		return usersService.getAllUsers();
	}

}

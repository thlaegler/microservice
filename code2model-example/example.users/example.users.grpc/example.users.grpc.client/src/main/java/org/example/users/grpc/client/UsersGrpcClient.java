package org.example.users.grpc.client;

import org.example.users.grpc.UsersGrpcModelConverter;
import org.example.users.grpc.spec.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/**
 * Shows how to extract error information from a server response.
 */
@Service
public class UsersGrpcClient extends AbstractUsersGrpcClient {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcClient.class);

	@Autowired
	private UsersGrpcModelConverter convert;

	@PostConstruct
	void init() {
		super.start();
	}

	@PreDestroy
	public void destroy() throws InterruptedException {
		super.shutdown();
	}

	public org.example.users.model.entity.User addUser(org.example.users.model.entity.User user) {
		LOG.trace("addUser({}) called", user.getUsername());

		User userResp = addUserBlockingCall(convert.toGrpcModel(user));
		// User userResp = addUserFutureCallDirect(toGrpcModel(user));
		// User userResp = addUserFutureCallCallback(toGrpcModel(user));
		// User userResp = addUserAsyncCall(toGrpcModel(user));
		// User userResp = addUserAdvancedAsyncCall(toGrpcModel(user));

		return convert.toEntityModel(userResp);
	}

	public org.example.users.model.entity.User updateUser(org.example.users.model.entity.User user) {
		LOG.trace("updateUser({}) called", user.getUsername());

		User userResp = updateUserBlockingCall(convert.toGrpcModel(user));

		return convert.toEntityModel(userResp);
	}

	public void deleteUser(long id) {
		LOG.trace("deleteUser({}) called", id);

		deleteUserBlockingCall(id);
	}

	public org.example.users.model.entity.User getUserById(long id) {
		LOG.trace("getUserById({}) called", id);

		User userResp = getUserByIdBlockingCall(id);

		return convert.toEntityModel(userResp);
	}

	public org.example.users.model.entity.User getUserByUsername(String username) {
		LOG.trace("getUserByUsername({}) called", username);

		User userResp = getUserByUsernameBlockingCall(username);

		return convert.toEntityModel(userResp);
	}

	public List<org.example.users.model.entity.User> getAllUsers() {
		LOG.trace("getAllUsers() called");

		List<User> usersResp = getAllUsersBlockingCall();

		return convert.toEntityModel(usersResp);
	}
}

package org.example.users.business;

import org.example.users.model.entity.User;
import org.example.users.model.repo.jpa.UserJpaRepo;
import org.example.users.model.repo.redis.UsersRedisRepo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsersService {

	private static final Logger LOG = LoggerFactory.getLogger(UsersService.class);

	@Autowired
	private UserJpaRepo jpaRepo;

	// @Autowired
	// private UserEsRepo esRepo;

	@Autowired
	private UsersRedisRepo redisRepo;

	public User addUser(User user) {
		LOG.trace("addUser({}) called", user.getUsername());

		return jpaRepo.saveAndFlush(user);
	}

	public User updateUser(User user) {
		LOG.trace("updateUser({}) called", user.getUsername());

		return jpaRepo.saveAndFlush(user);
	}

	public void deleteUser(long id) {
		LOG.trace("deleteUser({}) called", id);

		jpaRepo.delete(id);
	}

	public List<User> searchUser(String searchQuery) {
		LOG.trace("searchUser({}) called", searchQuery);

		// esRepo.findAllStreamed.collect(Collectors.toList);
		LOG.info("not implemented");
		return null;
	}

	public List<User> toCache(User user) {
		LOG.trace("toCache({}) called", user.getUsername());

		return redisRepo.findAllStreamed().collect(Collectors.toList());
	}

	public User getUserById(long id) {
		LOG.trace("getUserById({}) called", id);

		return jpaRepo.findOne(id);
	}

	public User getUserByUsername(String username) {
		LOG.trace("getUserByUsername({}) called", username);

		return jpaRepo.findOneByUsername(username);
	}

	public List<User> getAllUsers() {
		LOG.trace("getAllUsers() called");

		return jpaRepo.findAll();
	}

}

package org.example.users.business

import java.io.Serializable
import java.util.List
import java.util.stream.Collectors
import org.example.users.model.entity.User
import org.example.users.model.repo.elasticsearch.UserEsRepo
import org.example.users.model.repo.jpa.UserJpaRepo
import org.example.users.model.repo.redis.UsersRedisRepo
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class UsersService implements Serializable {

	private static final Logger LOG = LoggerFactory.getLogger(UsersService);

	@Autowired
	UserJpaRepo jpaRepo

//	@Autowired
//	UserEsRepo esRepo

	@Autowired
	UsersRedisRepo redisRepo

	def User addUser(User user) {
		LOG.trace('addUser({}) called', user.username)

		jpaRepo.saveAndFlush(user)
	}

	def User updateUser(User user) {
		LOG.trace('updateUser({}) called', user.username)

		jpaRepo.saveAndFlush(user)
	}

	def void deleteUser(long id) {
		LOG.trace('deleteUser({}) called', id)

		jpaRepo.delete(id)
	}

	def List<User> searchUser(String searchQuery) {
		LOG.trace('searchUser({}) called', searchQuery)

//		esRepo.findAllStreamed.collect(Collectors.toList)
		null
	}

	def List<User> toCache(User user) {
		LOG.trace('toCache({}) called', user.username)

		redisRepo.findAllStreamed.collect(Collectors.toList)
	}

	def User getUserById(long id) {
		LOG.trace('getUserById({}) called', id)

		jpaRepo.findOne(id)
	}

	def User getUserByUsername(String username) {
		LOG.trace('getUserByUsername({}) called', username)

		jpaRepo.findOneByUsername(username)
	}

	def List<User> getAllUsers() {
		LOG.trace('getAllUsers() called')

		jpaRepo.findAll
	}

}

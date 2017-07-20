package com.laegler.microservice.example.code2model.user.business

import com.laegler.microservice.example.code2model.user.model.entity.User
import com.laegler.microservice.example.code2model.user.model.repo.elasticsearch.UserEsRepo
import com.laegler.microservice.example.code2model.user.model.repo.jpa.UserJpaRepo
import com.laegler.microservice.example.code2model.user.model.repo.redis.UserRedisRepo
import java.io.Serializable
import java.util.List
import java.util.stream.Collectors
import javax.inject.Inject
import org.slf4j.Logger
import org.springframework.stereotype.Service

@Service
public class UserService implements Serializable {

	@Inject Logger LOG

	@Inject UserJpaRepo jpaRepo

	@Inject UserEsRepo esRepo

	@Inject UserRedisRepo redisRepo

	public def List<User> searchUser(String searchQuery) {
		esRepo.findAllStreamed.collect(Collectors.toList)
	}

	public def List<User> toCache(User user) {
		redisRepo.findAllStreamed.collect(Collectors.toList)
	}

	public def User getUserById(long id) {
		jpaRepo.findOne(id)
	}

	public def List<User> getAllUsers(long id) {
		jpaRepo.findAll
	}

}

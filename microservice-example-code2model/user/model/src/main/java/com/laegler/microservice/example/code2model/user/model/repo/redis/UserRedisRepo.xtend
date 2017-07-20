package com.laegler.microservice.example.code2model.user.model.repo.redis;

import com.laegler.microservice.example.code2model.user.model.entity.User
import java.util.Map
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.jpa.repository.Query

interface UserRedisRepo {

	def void save(User user)

	def User findOne(long id)

	def Map<Object, User> findAll()

	def void delete(long id)

	@Query("SELECT u FROM User u")
	def Page<User> findAllPaged(Pageable pageable)

	@Query("SELECT u FROM User u")
	def Slice<User> findAllSliced(Pageable pageable)

	@Query("SELECT u FROM User u")
	def Stream<User> findAllStreamed()

}

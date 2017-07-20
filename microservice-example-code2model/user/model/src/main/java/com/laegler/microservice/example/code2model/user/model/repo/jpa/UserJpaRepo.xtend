package com.laegler.microservice.example.code2model.user.model.repo.jpa;

import com.laegler.microservice.example.code2model.user.model.entity.User
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface UserJpaRepo extends JpaRepository<User, Long> {

	@Query("SELECT p FROM User u")
	def Page<User> findAllPaged(Pageable pageable)

	@Query("SELECT p FROM User u ")
	def Slice<User> findAllSliced(Pageable pageable)

	@Query("SELECT p FROM User u")
	def Stream<User> findAllStreamed()

}

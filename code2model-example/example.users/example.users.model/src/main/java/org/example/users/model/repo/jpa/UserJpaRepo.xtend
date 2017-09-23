package org.example.users.model.repo.jpa;

import org.example.users.model.entity.User
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface UserJpaRepo extends JpaRepository<User, Long> {

	def User findOneByUsername(String username)

	@Query("SELECT u FROM User u")
	def Page<User> findAllPaged(Pageable pageable)

	@Query("SELECT u FROM User u ")
	def Slice<User> findAllSliced(Pageable pageable)

	@Query("SELECT u FROM User u")
	def Stream<User> findAllStreamed()

}

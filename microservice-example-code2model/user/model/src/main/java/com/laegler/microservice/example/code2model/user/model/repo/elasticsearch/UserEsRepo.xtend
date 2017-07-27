package com.laegler.microservice.example.code2model.user.model.repo.elasticsearch;

import com.laegler.microservice.example.code2model.user.model.entity.User
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.elasticsearch.annotations.Query
import org.springframework.data.elasticsearch.repository.support.NumberKeyedRepository

class UserEsRepo extends NumberKeyedRepository<User, Long> {

	@Query("SELECT u FROM User u")
	def Page<User> findAllPaged(Pageable pageable) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	@Query("SELECT u FROM User u")
	def Slice<User> findAllSliced(Pageable pageable) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	@Query("SELECT u FROM User u")
	def Stream<User> findAllStreamed() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends User> index(S entity) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends User> save(S entity) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends User> save(Iterable<S> entities) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}

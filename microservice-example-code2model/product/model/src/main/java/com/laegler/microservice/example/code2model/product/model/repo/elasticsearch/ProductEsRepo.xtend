package com.laegler.microservice.example.code2model.product.model.repo.elasticsearch;

import com.laegler.microservice.example.code2model.product.model.entity.Product
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.elasticsearch.annotations.Query
import org.springframework.data.elasticsearch.repository.support.NumberKeyedRepository

class ProductEsRepo extends NumberKeyedRepository<Product, Long> {

	@Query("SELECT p FROM Product p")
	def Page<Product> findAllPaged(Pageable pageable) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	@Query("SELECT p FROM Product p")
	def Slice<Product> findAllSliced(Pageable pageable) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	@Query("SELECT p FROM Product p")
	def Stream<Product> findAllStreamed() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends Product> index(S entity) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends Product> save(S entity) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <S extends Product> save(Iterable<S> entities) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}

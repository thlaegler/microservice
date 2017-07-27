package com.laegler.microservice.example.code2model.product.model.repo.redis;

import com.laegler.microservice.example.code2model.product.model.entity.Product
import java.util.Map
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.jpa.repository.Query

interface ProductRedisRepo {

	def void save(Product product)

	def Product findOne(String id)

	def Map<Object, Product> findAll()

	def void delete(String id)

	@Query("SELECT p FROM Product p")
	def Page<Product> findAllPaged(Pageable pageable)

	@Query("SELECT p FROM Product p")
	def Slice<Product> findAllSliced(Pageable pageable)

	@Query("SELECT p FROM Product p")
	def Stream<Product> findAllStreamed()

}

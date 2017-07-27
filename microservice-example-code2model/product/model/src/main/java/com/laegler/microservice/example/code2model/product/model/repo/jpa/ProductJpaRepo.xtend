package com.laegler.microservice.example.code2model.product.model.repo.jpa;

import com.laegler.microservice.example.code2model.product.model.entity.Product
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Slice
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface ProductJpaRepo extends JpaRepository<Product, Long> {

	@Query("SELECT p FROM Product p")
	def Page<Product> findAllPaged(Pageable pageable)

	@Query("SELECT p FROM Product p ")
	def Slice<Product> findAllSliced(Pageable pageable)

	@Query("SELECT p FROM Product p")
	def Stream<Product> findAllStreamed()

}

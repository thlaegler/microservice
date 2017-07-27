package com.laegler.microservice.example.code2model.product.business

import com.laegler.microservice.example.code2model.product.model.entity.Product
import com.laegler.microservice.example.code2model.product.model.repo.elasticsearch.ProductEsRepo
import com.laegler.microservice.example.code2model.product.model.repo.jpa.ProductJpaRepo
import com.laegler.microservice.example.code2model.product.model.repo.redis.ProductRedisRepo
import java.io.Serializable
import java.util.List
import java.util.stream.Collectors
import javax.inject.Inject
import org.slf4j.Logger
import org.springframework.stereotype.Service

@Service
public class ProductService implements Serializable {

	@Inject Logger LOG

	@Inject ProductJpaRepo jpaRepo

	@Inject ProductEsRepo esRepo

	@Inject ProductRedisRepo redisRepo

	public def List<Product> searchProduct(String searchQuery) {
		esRepo.findAllStreamed.collect(Collectors.toList)
	}

	public def List<Product> toCache(Product product) {
		redisRepo.findAllStreamed.collect(Collectors.toList)
	}

	public def Product getProductById(long id) {
		jpaRepo.findOne(id)
	}

	public def List<Product> getAllProducts(long id) {
		jpaRepo.findAll
	}

}

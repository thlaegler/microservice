package com.laegler.microservice.example.code2model.product.rest

import com.laegler.microservice.example.code2model.product.business.ProductService
import com.laegler.microservice.example.code2model.product.model.entity.Product
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import io.swagger.annotations.ApiResponse
import io.swagger.annotations.ApiResponses
import javax.inject.Inject
import org.slf4j.Logger
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@Api(tags='Product REST Service')
@RestController
@RequestMapping(value='/products')
public class ProductRest {

	@Inject
	Logger LOG

	@Autowired
	ProductService service;

	@ApiOperation(value='Get one particular product by ID', response=Product)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@GetMapping(produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> productGet(
		@ApiParam(value='Product ID') @RequestParam(value='Product ID', defaultValue='', required=false) long id) {
		LOG.debug('productGet({}) called', id);

		service.getProductById(id)

		return ResponseEntity.ok('Successfully triggered reindexing')
	}
}

package com.laegler.microservice.example.code2model.user.rest

import com.laegler.microservice.example.code2model.user.business.User
import com.laegler.microservice.example.code2model.user.model.entity.User
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

@Api(tags='User REST Service')
@RestController
@RequestMapping(value='/users')
public class UserRest {

	@Inject
	Logger LOG

	@Autowired
	UserService service;

	@ApiOperation(value='Get one particular product by ID', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@GetMapping(produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> userGet(
		@ApiParam(value='User ID') @RequestParam(value='Product ID', defaultValue='', required=false) long id) {
		LOG.debug('productGet({}) called', id);

		service.getUserById(id)

		return ResponseEntity.ok('Successfully triggered reindexing')
	}
}

package org.example.users.rest

import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import io.swagger.annotations.ApiResponse
import io.swagger.annotations.ApiResponses
import org.example.users.rest.model.User
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@Api(tags='User REST Service')
@RestController
@RequestMapping(value='/users')
class UsersRest extends AbstractUsersRest {

	private static final Logger LOG = LoggerFactory.getLogger(UsersRest)

	@ApiOperation(value='Add a new user', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@PostMapping(consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> addUserPOST(@ApiParam(value='user') @RequestBody(required=false) User user) {
		LOG.trace('addUserPOST({}) called', user.username)

		super.addUser(user)
	}

	@ApiOperation(value='Update an existing new user', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@PutMapping(value='/{userId:[0-9]+}', consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.
		APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> addUserPUT(@ApiParam(value='user') @RequestBody(required=false) User user) {
		LOG.trace('addUserPUT({}) called', user.username)

		super.updateUser(user)
	}

	@ApiOperation(value='Delete a user by ID', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@DeleteMapping(value='/{userId:[0-9]+}')
	public def ResponseEntity<?> userDELETE(
		@ApiParam(value='user ID', example='1') @PathVariable(value='userId', required=false) long id) {
		LOG.trace('userByIdGET({}) called', id)

		super.deleteUser(id)
	}

	@ApiOperation(value='Get a user by ID', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@GetMapping(value='/{userId:[0-9]+}', produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> userByIdGET(
		@ApiParam(value='user ID', example='1') @PathVariable(value='userId', required=false) long id) {
		LOG.trace('userByIdGET({}) called', id)

		super.getUserById(id)
	}

	@ApiOperation(value='Get a user by username', response=User)
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@GetMapping(value='/{username:[A-Za-z]+[a-zA-Z0-9-]*}', produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> userByUsernameGET(
		@ApiParam(value='user ID', example='1') @PathVariable(value='username', required=false) String username) {
		LOG.trace('userByUsernameGET({}) called', username)

		super.getUserByUsername(username)
	}

	@ApiOperation(value='Get all users', response=User, responseContainer='List')
	@ApiResponses(value=#[
		@ApiResponse(code=200, message='Ok'),
		@ApiResponse(code=503, message='Service not available'),
		@ApiResponse(code=500, message='Internal server error')
	])
	@GetMapping(produces=MediaType.APPLICATION_JSON_VALUE)
	public def ResponseEntity<?> allUsersGET() {
		LOG.trace('allUsersGET({}) called')

		super.getAllUsers()
	}

}

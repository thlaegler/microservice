package org.example.users.rest;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.example.users.rest.model.User;
import org.example.users.rest.model.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "User REST Service")
@RestController
@RequestMapping(value = "/users")
public class UsersRest extends AbstractUsersRest {

	private static final Logger LOG = LoggerFactory.getLogger(UsersRest.class);

	@ApiOperation(value = "Add a new user", response = User.class)
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> addUserPOST(@ApiParam(value = "user") @RequestBody(required = false) User user) {
		LOG.trace("addUserPOST({}) called", user.getUsername());

		User userResp = super.addUser(user);

		// Add HATEOAS self link and list links to response object
		userResp.add(linkTo(methodOn(UsersRest.class).userByIdGET(userResp.getUserId())).withSelfRel());
		userResp.add(linkTo(methodOn(UsersRest.class).allUsersGET()).withRel("list"));
		return ResponseEntity.ok(userResp);
	}

	@ApiOperation(value = "Update an existing new user", response = User.class)
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@PutMapping(value = "/{userId:[0-9]+}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> updateUserPUT(@ApiParam(value = "user") @RequestBody(required = false) User user) {
		LOG.trace("updateUserPUT({}) called", user.getUsername());

		User userResp = super.updateUser(user);

		// Add HATEOAS self link and list links to response object
		userResp.add(linkTo(methodOn(UsersRest.class).userByIdGET(userResp.getUserId())).withSelfRel());
		userResp.add(linkTo(methodOn(UsersRest.class).allUsersGET()).withRel("list"));
		return ResponseEntity.ok(userResp);
	}

	@ApiOperation(value = "Delete a user by ID", response = User.class)
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@DeleteMapping(value = "/{userId:[0-9]+}")
	public ResponseEntity<?> userDELETE(
			@ApiParam(value = "user ID", example = "1") @PathVariable(value = "userId", required = false) long id) {
		LOG.trace("userDELETE({}) called", id);

		super.deleteUser(id);

		return ResponseEntity.noContent().build();
	}

	@ApiOperation(value = "Get a user by ID", response = User.class)
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@GetMapping(value = "/{userId:[0-9]+}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> userByIdGET(
			@ApiParam(value = "user ID", example = "1") @PathVariable(value = "userId", required = false) long id) {
		LOG.trace("userByIdGET({}) called", id);

		User userResp = super.getUserById(id);

		// Add HATEOAS self link and list links to response object
		userResp.add(linkTo(methodOn(UsersRest.class).userByIdGET(userResp.getUserId())).withSelfRel());
		userResp.add(linkTo(methodOn(UsersRest.class).allUsersGET()).withRel("list"));
		return ResponseEntity.ok(userResp);
	}

	@ApiOperation(value = "Get a user by username", response = User.class)
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@GetMapping(value = "/{username:[A-Za-z]+[a-zA-Z0-9-]*}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> userByUsernameGET(
			@ApiParam(value = "user ID", example = "1") @PathVariable(value = "username", required = false) String username) {
		LOG.trace("userByUsernameGET({}) called", username);

		User userResp = super.getUserByUsername(username);

		// Add HATEOAS self link and list links to response object
		userResp.add(linkTo(methodOn(UsersRest.class).userByIdGET(userResp.getUserId())).withSelfRel());
		userResp.add(linkTo(methodOn(UsersRest.class).allUsersGET()).withRel("list"));
		return ResponseEntity.ok(userResp);
	}

	@ApiOperation(value = "Get all users", response = User.class, responseContainer = "List")
	@ApiResponses(value = {@ApiResponse(code = 200, message = "Ok"), @ApiResponse(code = 503, message = "Service not available"),
			@ApiResponse(code = 500, message = "Internal server error")})
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> allUsersGET() {
		LOG.trace("allUsersGET({}) called");

		List<User> usersList = super.getAllUsers();
		Users usersResp = Users.builder().users(usersList).build();

		// Add HATEOAS self link
		usersResp.getUsers().stream().forEach(u -> u.add(linkTo(methodOn(UsersRest.class).userByIdGET(u.getUserId())).withRel("get_user")));
		usersResp.add(linkTo(methodOn(UsersRest.class).allUsersGET()).withSelfRel());
		return ResponseEntity.ok(usersResp);
	}

}

package org.example.users.rest.model

import com.fasterxml.jackson.annotation.JsonCreator
import com.fasterxml.jackson.annotation.JsonProperty
import io.swagger.annotations.ApiParam
import lombok.AllArgsConstructor
import lombok.Builder
import org.eclipse.xtend.lib.annotations.Accessors
import org.springframework.hateoas.ResourceSupport

@Accessors
@Builder
@AllArgsConstructor
class User extends ResourceSupport {

	@ApiParam(example='1')
	@JsonProperty
	long userId

	@ApiParam(example='abc')
	@JsonProperty
	String username

	@ApiParam(example='abc@abc.abc')
	@JsonProperty
	String email

	@ApiParam(example='abc')
	@JsonProperty
	String firstname

	@ApiParam(example='abc')
	@JsonProperty
	String lastname

	@JsonCreator
	new() {
	}

}

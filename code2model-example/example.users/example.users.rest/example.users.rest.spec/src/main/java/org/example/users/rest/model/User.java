package org.example.users.rest.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.hateoas.ResourceSupport;

@Data
@Builder
@AllArgsConstructor
public class User extends ResourceSupport {

	@ApiParam(example = "1")
	@JsonProperty
	private long userId;

	@ApiParam(example = "abc")
	@JsonProperty
	private String username;

	@ApiParam(example = "abc@abc.abc")
	@JsonProperty
	private String email;

	@ApiParam(example = "abc")
	@JsonProperty
	private String firstname;

	@ApiParam(example = "abc")
	@JsonProperty
	private String lastname;

	@JsonCreator
	public User() {
		// null
	}

}

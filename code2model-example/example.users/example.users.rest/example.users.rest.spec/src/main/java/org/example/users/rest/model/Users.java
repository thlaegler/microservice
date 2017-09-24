package org.example.users.rest.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.hateoas.ResourceSupport;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
public class Users extends ResourceSupport {

	@ApiParam
	@JsonProperty
	private List<User> users;

	@JsonCreator
	public Users() {
		// null
	}

}

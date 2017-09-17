package org.example.gateway;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ErrorResponse {

	@JsonProperty(value = "error")
	private String error;

	@JsonProperty(value = "error_message")
	private String errorMessage;
}

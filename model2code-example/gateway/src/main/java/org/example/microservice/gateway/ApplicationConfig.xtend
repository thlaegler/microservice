package org.example.microservice

import javax.inject.Inject
import org.slf4j.Logger
import org.springframework.context.annotation.Configuration

@Configuration
class ApplicationConfig {

	@Inject	Logger log

}

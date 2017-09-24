package org.example.users.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class UsersRestConfig extends AbstractUsersRestConfig {

	private static final Logger LOG = LoggerFactory.getLogger(UsersRestConfig.class);

	@Bean
	@Override
	public Docket swaggerApi() {
		LOG.trace("swaggerApi() called");

		return super.swaggerApi();
	}

	@Bean
	@Override
	public UiConfiguration swaggerUiConfig() {
		LOG.trace("swaggerUiConfig() called");

		return super.swaggerUiConfig();
	}
}

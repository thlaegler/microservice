package org.example.users.rest

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import springfox.documentation.builders.PathSelectors
import springfox.documentation.builders.RequestHandlerSelectors
import springfox.documentation.spi.DocumentationType
import springfox.documentation.spring.web.plugins.Docket
import springfox.documentation.swagger.web.UiConfiguration

abstract public class AbstractUsersRestConfig {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersRestConfig)

	protected def Docket swaggerApi() {
		LOG.trace('swaggerApi() called')

		new Docket(DocumentationType.SWAGGER_2).select().apis(RequestHandlerSelectors.any()).paths(PathSelectors.any()).
			build
	}

	protected def UiConfiguration swaggerUiConfig() {
		LOG.trace('swaggerUiConfig() called')

		new UiConfiguration('validatorUrl', 'none', 'alpha', 'schema', UiConfiguration.Constants.DEFAULT_SUBMIT_METHODS,
			true, true)
	}
}

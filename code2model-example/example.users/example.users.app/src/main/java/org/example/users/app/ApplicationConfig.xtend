package org.example.users.app

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration

@Configuration
@ComponentScan(basePackages=#['org.example'])
class ApplicationConfig {

	private static final Logger LOG = LoggerFactory.getLogger(ApplicationConfig)

}

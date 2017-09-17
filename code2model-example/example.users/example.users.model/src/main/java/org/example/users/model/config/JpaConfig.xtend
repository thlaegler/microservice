package org.example.users.model.config

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.boot.autoconfigure.domain.EntityScan
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@Configuration
@EntityScan(basePackages='org.example.users.model.entity')
@EnableJpaRepositories(basePackages='org.example.users.model.repo.jpa')
class JpaConfig {

	private static final Logger LOG = LoggerFactory.getLogger(JpaConfig)

}

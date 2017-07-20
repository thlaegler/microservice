package com.laegler.microservice.example.code2model.product.model.config

import org.elasticsearch.common.inject.Inject
import org.slf4j.Logger
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@Configuration
@EnableJpaRepositories(basePackages='com.laegler.microservice.example.code2model.product.model.repo.jpa')
class JpaConfig {

	@Inject
	Logger LOG

}

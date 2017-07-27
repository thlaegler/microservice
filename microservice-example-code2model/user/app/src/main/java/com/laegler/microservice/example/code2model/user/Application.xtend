package com.laegler.microservice.example.code2model.user

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class Application {

	private static final Logger LOG = LoggerFactory.getLogger(Application);

	public static def void main(String[] args) {
		LOG.debug('Trying to start User Spring App ...')
		SpringApplication.run(Application, args)
		LOG.debug('User Spring App started succesfully')
	}

}

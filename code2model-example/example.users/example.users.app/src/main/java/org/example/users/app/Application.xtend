package org.example.users.app

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class Application {

	private static final Logger LOG = LoggerFactory.getLogger(Application)

	public static def void main(String[] args) {
		val ctx = SpringApplication.run(Application, args)
		LOG.trace('Users Application started: {}', ctx.id)
	}

}

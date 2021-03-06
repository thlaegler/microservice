package org.example.microservice

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class Application {

	private static final Logger LOG = LoggerFactory.getLogger(Application);

	public static def void main(String[] args) {
		var ConfigurableApplicationContext ctx = SpringApplication.run(Application, args)
		LOG.info('Started ' + ctx.getId());
	}

}

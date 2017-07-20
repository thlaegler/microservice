package com.laegler.microservice.example.code2model.product

import com.laegler.microservice.example.code2model.product.grpc.server.ProductGrpcServer
import javax.annotation.PostConstruct
import javax.annotation.PreDestroy
import org.elasticsearch.common.inject.Inject
import org.slf4j.Logger
import org.springframework.context.annotation.Configuration

@Configuration
class ApplicationConfig {

	@Inject	Logger log

	@Inject
	ProductGrpcServer productGrpcServer

	@PostConstruct
	public def void init() {
		log.debug('Starting Product gRPC client...')
		productGrpcServer.start
		log.info('Product gRPC client started')
	}

	@PreDestroy
	public def void destroy() {
		try {
			productGrpcServer.shutDown
		} catch (InterruptedException e) {
			log.warn('Failed to shutdown Product RPC client. This is not a big issue ;)')
		}
	}
}

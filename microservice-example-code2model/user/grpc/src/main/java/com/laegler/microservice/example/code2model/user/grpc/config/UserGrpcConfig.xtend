package com.laegler.microservice.example.code2model.user.grpc.config

import org.springframework.context.annotation.Configuration
import javax.inject.Inject
import org.slf4j.Logger

@Configuration
class UserGrpcConfig {

	@Inject
	Logger LOG

	@Inject
	ProductGrpcClient productGrpcClient

	@PostConstruct
	public def void init() {
		LOG.debug('Starting Product gRPC client...')
		productGrpcClient.start
		LOG.info('Product gRPC client started')
	}

	@PreDestroy
	public def void destroy() {
		try {
			productGrpcClient.shut
		} catch (InterruptedException e) {
			LOG.warn('Failed to shutdown Product RPC client. This is not a big issue ;)')
		}
	}
}

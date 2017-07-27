package com.laegler.microservice.example.code2model.user

import org.springframework.context.annotation.Configuration
import org.slf4j.Logger
import javax.annotation.PostConstruct
import org.elasticsearch.common.inject.Inject
import javax.annotation.PreDestroy
import com.laegler.microservice.example.code2model.product.grpc.client.ProductGrpcClient

@Configuration
class ApplicationConfig {

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

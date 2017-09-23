package org.example.users.grpc.client;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UsersGrpcClientConfig {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcClientConfig.class);

	// @Inject
	// ProductGrpcClient productGrpcClient
	//
	// @PostConstruct
	// public def void init() {
	// LOG.trace('Starting Product gRPC client...')
	// productGrpcClient.start
	// LOG.info('Product gRPC client started')
	// }
	//
	// @PreDestroy
	// public def void destroy() {
	// try {
	// productGrpcClient.shut
	// } catch (InterruptedException e) {
	// LOG.warn('Failed to shutdown Product RPC client. This is not a big issue ;)')
	// }
	// }
}

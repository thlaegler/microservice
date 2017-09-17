package org.example.oauth2.config;

import org.example.users.grpc.client.UsersGrpcClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Configuration
public class GrpcClientConfig {

	private static final Logger LOG = LoggerFactory.getLogger(GrpcClientConfig.class);

	@Autowired
	private UsersGrpcClient usersGrpcClient;

	@PostConstruct
	public void startUsersGrpcClient() {
		LOG.trace("startUsersGrpcClient() called");

		usersGrpcClient.start();
	}

	@PreDestroy
	public void destryUsersGrpcClient() {
		LOG.trace("startUsersGrpcClient() called");

		try {
			usersGrpcClient.shutdown();
		} catch (InterruptedException e) {
			LOG.warn("Failed to shutdown gRPC client. This is not a big issue.");
		}
	}
}

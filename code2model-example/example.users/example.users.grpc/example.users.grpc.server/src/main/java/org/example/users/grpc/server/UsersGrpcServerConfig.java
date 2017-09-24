package org.example.users.grpc.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;

@Configuration
class UsersGrpcServerConfig extends AbstractUsersGrpcServerConfig {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcServerConfig.class);

}

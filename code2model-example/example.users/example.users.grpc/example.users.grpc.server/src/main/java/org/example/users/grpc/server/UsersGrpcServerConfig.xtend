package org.example.users.grpc.server

import org.springframework.context.annotation.Configuration
import org.slf4j.Logger
import javax.annotation.PostConstruct
import org.slf4j.LoggerFactory
import javax.annotation.PreDestroy
import org.springframework.beans.factory.annotation.Autowired
import java.io.IOException

@Configuration
class UsersGrpcServerConfig extends AbstractUsersGrpcServerConfig {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcServerConfig)

}

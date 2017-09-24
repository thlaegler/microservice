package org.example.users.grpc.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Service
class UsersGrpcServer extends AbstractUsersGrpcServer {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcServer.class);

	@PostConstruct
	public void init() throws IOException, InterruptedException {
		super.start();
	}

	@PreDestroy
	public void destroy() {
		super.shutdown();
	}

}

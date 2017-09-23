package org.example.users.grpc.server;

import io.grpc.Server;
import io.grpc.ServerBuilder;
import io.grpc.ServerInterceptors;
import org.example.utils.requesthandler.ServerGrpcInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.io.IOException;

abstract public class AbstractUsersGrpcServer {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersGrpcServer.class);

	@Value("${org.example.users.grpcPort:7071}")
	private int port;

	@Autowired
	private ServerGrpcInterceptor interceptor;

	private Server server;

	public void start() throws IOException, InterruptedException {
		server = ServerBuilder //
				.forPort(port) //
				.addService(ServerInterceptors.intercept(new UsersGrpcServiceImpl(), interceptor)) //
				.build().start();
		// blockUntilShutdown();

		Runtime.getRuntime().addShutdownHook(new Thread() {
			@Override
			public void run() {
				AbstractUsersGrpcServer.this.shutdown();
			}
		});
	}

	public void shutdown() {
		if (server != null) {
			server.shutdown();
		}
	}

	private void blockUntilShutdown() throws InterruptedException {
		if (server != null) {
			server.awaitTermination();
		}
	}

}

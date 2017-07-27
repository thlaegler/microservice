package com.laegler.microservice.example.code2model.product.grpc.server

import org.springframework.stereotype.Service
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component
import org.slf4j.Logger
import java.io.IOException
import io.grpc.ServerBuilder
import io.grpc.ServerInterceptors
import io.grpc.Server

@Component
class ProductGrpcServer {

	@Autowired Logger LOG

	@Autowired ProductServiceGrpcImpl settingsServiceGrpc;

	@Autowired GrpcServerInterceptor grpcServerInterceptor

	@Value("${example.product.grpc.port}")
	int grpcPort

	Server server

	def void start() throws IOException {
		LOG.info("Trying to start Product gRPC Server on port " + grpcPort);

		server = ServerBuilder.forPort(grpcPort).addService(
			ServerInterceptors.intercept(settingsServiceGrpc, grpcServerInterceptor)).build().start();

		LOG.info("Product gRPC Server started and listening on " + grpcPort);

		Runtime.getRuntime().addShutdownHook(new Thread() {
			override void run() {
				LOG.info("*** shutting down gRPC server since JVM is shutting down");
				ProductGrpcServer.this.stop();
				LOG.info("*** server shut down");
			}
		});
	}

	def void stop() {
		if (server != null) {
			server.shutdown()
		}
	}

	def void blockUntilShutdown() throws InterruptedException {
		if (server != null) {
			server.awaitTermination
		}
	}
}

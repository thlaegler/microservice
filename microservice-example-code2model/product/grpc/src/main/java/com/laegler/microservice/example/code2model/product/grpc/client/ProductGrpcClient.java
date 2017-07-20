package com.laegler.microservice.example.code2model.product.grpc.client;

import java.util.concurrent.TimeUnit;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.grpc.Channel;
import io.grpc.ClientInterceptors;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;

@Component
public class ProductGrpcClient {

  @Inject
  private Logger LOG;

  private ManagedChannel grpcChannel;

  private ProductServiceBlockingStub grpcStub;

  @Value("${example.product.host}")
  private String grpcHost;

  @Value("${example.product.grpc.port}")
  private int grpcPort;

  @Autowired
  private GrpcClientInterceptor grpcClientInterceptor;

  public void start() {
    LOG.info("Initializing settings gRPC client");

    grpcChannel = ManagedChannelBuilder.forAddress(grpcHost, grpcPort).usePlaintext(true).build();

    Channel channel = ClientInterceptors.intercept(grpcChannel, grpcClientInterceptor);
    grpcStub = ProductSettingsServiceGrpc.newBlockingStub(channel);
    configurationServiceGrpcStub = ProductSearchConfigurationServiceGrpc.newBlockingStub(channel);
    LOG.info("Settings gRPC client initialized");
  }

  public void shutdown() throws InterruptedException {
    LOG.info("Shutting down");

    grpcChannel.shutdown().awaitTermination(5, TimeUnit.SECONDS);

    LOG.info("Shut down");
  }

  public void shutdownNow() {
    grpcChannel.shutdownNow();
  }

  public GetProductResponse getXmSetting(final long id) {
    LOG.debug("Request Product for ID {}", id);

    return grpcStub.getXmSetting(buildProductRequest(id));
  }

  private GetProductRequest buildProductRequest(String scope) {
    return GetProductRequest.newBuilder().setScope(scope).build();
  }
}

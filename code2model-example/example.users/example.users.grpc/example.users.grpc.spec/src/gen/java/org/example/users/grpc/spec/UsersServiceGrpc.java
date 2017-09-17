package org.example.users.grpc.spec;

import static io.grpc.stub.ClientCalls.asyncUnaryCall;
import static io.grpc.stub.ClientCalls.asyncServerStreamingCall;
import static io.grpc.stub.ClientCalls.asyncClientStreamingCall;
import static io.grpc.stub.ClientCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ClientCalls.blockingUnaryCall;
import static io.grpc.stub.ClientCalls.blockingServerStreamingCall;
import static io.grpc.stub.ClientCalls.futureUnaryCall;
import static io.grpc.MethodDescriptor.generateFullMethodName;
import static io.grpc.stub.ServerCalls.asyncUnaryCall;
import static io.grpc.stub.ServerCalls.asyncServerStreamingCall;
import static io.grpc.stub.ServerCalls.asyncClientStreamingCall;
import static io.grpc.stub.ServerCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedStreamingCall;

/**
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.4.0)",
    comments = "Source: users.proto")
public final class UsersServiceGrpc {

  private UsersServiceGrpc() {}

  public static final String SERVICE_NAME = "org.example.users.grpc.spec.UsersService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.UserRequest,
      org.example.users.grpc.spec.OneUserResponse> METHOD_ADD_USER =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.UserRequest, org.example.users.grpc.spec.OneUserResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "AddUser"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.UserRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.OneUserResponse.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.UserRequest,
      org.example.users.grpc.spec.OneUserResponse> METHOD_UPDATE_USER =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.UserRequest, org.example.users.grpc.spec.OneUserResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "UpdateUser"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.UserRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.OneUserResponse.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.UserIdRequest,
      org.example.users.grpc.spec.VoidResponse> METHOD_DELETE_USER =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.UserIdRequest, org.example.users.grpc.spec.VoidResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "DeleteUser"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.UserIdRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.VoidResponse.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.UserIdRequest,
      org.example.users.grpc.spec.OneUserResponse> METHOD_GET_USER_BY_ID =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.UserIdRequest, org.example.users.grpc.spec.OneUserResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "GetUserById"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.UserIdRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.OneUserResponse.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.UsernameRequest,
      org.example.users.grpc.spec.OneUserResponse> METHOD_GET_USER_BY_USERNAME =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.UsernameRequest, org.example.users.grpc.spec.OneUserResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "GetUserByUsername"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.UsernameRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.OneUserResponse.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<org.example.users.grpc.spec.VoidRequest,
      org.example.users.grpc.spec.MultipleUsersResponse> METHOD_GET_ALL_USERS =
      io.grpc.MethodDescriptor.<org.example.users.grpc.spec.VoidRequest, org.example.users.grpc.spec.MultipleUsersResponse>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "org.example.users.grpc.spec.UsersService", "GetAllUsers"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.VoidRequest.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              org.example.users.grpc.spec.MultipleUsersResponse.getDefaultInstance()))
          .build();

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static UsersServiceStub newStub(io.grpc.Channel channel) {
    return new UsersServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static UsersServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new UsersServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static UsersServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new UsersServiceFutureStub(channel);
  }

  /**
   */
  public static abstract class UsersServiceImplBase implements io.grpc.BindableService {

    /**
     */
    public void addUser(org.example.users.grpc.spec.UserRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_ADD_USER, responseObserver);
    }

    /**
     */
    public void updateUser(org.example.users.grpc.spec.UserRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_UPDATE_USER, responseObserver);
    }

    /**
     */
    public void deleteUser(org.example.users.grpc.spec.UserIdRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.VoidResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_DELETE_USER, responseObserver);
    }

    /**
     */
    public void getUserById(org.example.users.grpc.spec.UserIdRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_GET_USER_BY_ID, responseObserver);
    }

    /**
     */
    public void getUserByUsername(org.example.users.grpc.spec.UsernameRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_GET_USER_BY_USERNAME, responseObserver);
    }

    /**
     */
    public void getAllUsers(org.example.users.grpc.spec.VoidRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.MultipleUsersResponse> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_GET_ALL_USERS, responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            METHOD_ADD_USER,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.UserRequest,
                org.example.users.grpc.spec.OneUserResponse>(
                  this, METHODID_ADD_USER)))
          .addMethod(
            METHOD_UPDATE_USER,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.UserRequest,
                org.example.users.grpc.spec.OneUserResponse>(
                  this, METHODID_UPDATE_USER)))
          .addMethod(
            METHOD_DELETE_USER,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.UserIdRequest,
                org.example.users.grpc.spec.VoidResponse>(
                  this, METHODID_DELETE_USER)))
          .addMethod(
            METHOD_GET_USER_BY_ID,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.UserIdRequest,
                org.example.users.grpc.spec.OneUserResponse>(
                  this, METHODID_GET_USER_BY_ID)))
          .addMethod(
            METHOD_GET_USER_BY_USERNAME,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.UsernameRequest,
                org.example.users.grpc.spec.OneUserResponse>(
                  this, METHODID_GET_USER_BY_USERNAME)))
          .addMethod(
            METHOD_GET_ALL_USERS,
            asyncUnaryCall(
              new MethodHandlers<
                org.example.users.grpc.spec.VoidRequest,
                org.example.users.grpc.spec.MultipleUsersResponse>(
                  this, METHODID_GET_ALL_USERS)))
          .build();
    }
  }

  /**
   */
  public static final class UsersServiceStub extends io.grpc.stub.AbstractStub<UsersServiceStub> {
    private UsersServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private UsersServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected UsersServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new UsersServiceStub(channel, callOptions);
    }

    /**
     */
    public void addUser(org.example.users.grpc.spec.UserRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_ADD_USER, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void updateUser(org.example.users.grpc.spec.UserRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_UPDATE_USER, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void deleteUser(org.example.users.grpc.spec.UserIdRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.VoidResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_DELETE_USER, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void getUserById(org.example.users.grpc.spec.UserIdRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_GET_USER_BY_ID, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void getUserByUsername(org.example.users.grpc.spec.UsernameRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_GET_USER_BY_USERNAME, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void getAllUsers(org.example.users.grpc.spec.VoidRequest request,
        io.grpc.stub.StreamObserver<org.example.users.grpc.spec.MultipleUsersResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_GET_ALL_USERS, getCallOptions()), request, responseObserver);
    }
  }

  /**
   */
  public static final class UsersServiceBlockingStub extends io.grpc.stub.AbstractStub<UsersServiceBlockingStub> {
    private UsersServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private UsersServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected UsersServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new UsersServiceBlockingStub(channel, callOptions);
    }

    /**
     */
    public org.example.users.grpc.spec.OneUserResponse addUser(org.example.users.grpc.spec.UserRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_ADD_USER, getCallOptions(), request);
    }

    /**
     */
    public org.example.users.grpc.spec.OneUserResponse updateUser(org.example.users.grpc.spec.UserRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_UPDATE_USER, getCallOptions(), request);
    }

    /**
     */
    public org.example.users.grpc.spec.VoidResponse deleteUser(org.example.users.grpc.spec.UserIdRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_DELETE_USER, getCallOptions(), request);
    }

    /**
     */
    public org.example.users.grpc.spec.OneUserResponse getUserById(org.example.users.grpc.spec.UserIdRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_GET_USER_BY_ID, getCallOptions(), request);
    }

    /**
     */
    public org.example.users.grpc.spec.OneUserResponse getUserByUsername(org.example.users.grpc.spec.UsernameRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_GET_USER_BY_USERNAME, getCallOptions(), request);
    }

    /**
     */
    public org.example.users.grpc.spec.MultipleUsersResponse getAllUsers(org.example.users.grpc.spec.VoidRequest request) {
      return blockingUnaryCall(
          getChannel(), METHOD_GET_ALL_USERS, getCallOptions(), request);
    }
  }

  /**
   */
  public static final class UsersServiceFutureStub extends io.grpc.stub.AbstractStub<UsersServiceFutureStub> {
    private UsersServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private UsersServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected UsersServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new UsersServiceFutureStub(channel, callOptions);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.OneUserResponse> addUser(
        org.example.users.grpc.spec.UserRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_ADD_USER, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.OneUserResponse> updateUser(
        org.example.users.grpc.spec.UserRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_UPDATE_USER, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.VoidResponse> deleteUser(
        org.example.users.grpc.spec.UserIdRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_DELETE_USER, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.OneUserResponse> getUserById(
        org.example.users.grpc.spec.UserIdRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_GET_USER_BY_ID, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.OneUserResponse> getUserByUsername(
        org.example.users.grpc.spec.UsernameRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_GET_USER_BY_USERNAME, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<org.example.users.grpc.spec.MultipleUsersResponse> getAllUsers(
        org.example.users.grpc.spec.VoidRequest request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_GET_ALL_USERS, getCallOptions()), request);
    }
  }

  private static final int METHODID_ADD_USER = 0;
  private static final int METHODID_UPDATE_USER = 1;
  private static final int METHODID_DELETE_USER = 2;
  private static final int METHODID_GET_USER_BY_ID = 3;
  private static final int METHODID_GET_USER_BY_USERNAME = 4;
  private static final int METHODID_GET_ALL_USERS = 5;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final UsersServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(UsersServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_ADD_USER:
          serviceImpl.addUser((org.example.users.grpc.spec.UserRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse>) responseObserver);
          break;
        case METHODID_UPDATE_USER:
          serviceImpl.updateUser((org.example.users.grpc.spec.UserRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse>) responseObserver);
          break;
        case METHODID_DELETE_USER:
          serviceImpl.deleteUser((org.example.users.grpc.spec.UserIdRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.VoidResponse>) responseObserver);
          break;
        case METHODID_GET_USER_BY_ID:
          serviceImpl.getUserById((org.example.users.grpc.spec.UserIdRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse>) responseObserver);
          break;
        case METHODID_GET_USER_BY_USERNAME:
          serviceImpl.getUserByUsername((org.example.users.grpc.spec.UsernameRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.OneUserResponse>) responseObserver);
          break;
        case METHODID_GET_ALL_USERS:
          serviceImpl.getAllUsers((org.example.users.grpc.spec.VoidRequest) request,
              (io.grpc.stub.StreamObserver<org.example.users.grpc.spec.MultipleUsersResponse>) responseObserver);
          break;
        default:
          throw new AssertionError();
      }
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public io.grpc.stub.StreamObserver<Req> invoke(
        io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        default:
          throw new AssertionError();
      }
    }
  }

  private static final class UsersServiceDescriptorSupplier implements io.grpc.protobuf.ProtoFileDescriptorSupplier {
    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return org.example.users.grpc.spec.UsersProtobufService.getDescriptor();
    }
  }

  private static volatile io.grpc.ServiceDescriptor serviceDescriptor;

  public static io.grpc.ServiceDescriptor getServiceDescriptor() {
    io.grpc.ServiceDescriptor result = serviceDescriptor;
    if (result == null) {
      synchronized (UsersServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new UsersServiceDescriptorSupplier())
              .addMethod(METHOD_ADD_USER)
              .addMethod(METHOD_UPDATE_USER)
              .addMethod(METHOD_DELETE_USER)
              .addMethod(METHOD_GET_USER_BY_ID)
              .addMethod(METHOD_GET_USER_BY_USERNAME)
              .addMethod(METHOD_GET_ALL_USERS)
              .build();
        }
      }
    }
    return result;
  }
}

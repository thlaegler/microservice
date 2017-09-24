package org.example.users.grpc.client;

import com.google.common.base.Verify;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.Uninterruptibles;
import io.grpc.CallOptions;
import io.grpc.Channel;
import io.grpc.ClientCall;
import io.grpc.ClientInterceptors;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.Metadata;
import io.grpc.Status;
import io.grpc.stub.StreamObserver;
import org.example.users.grpc.spec.MultipleUsersResponse;
import org.example.users.grpc.spec.OneUserResponse;
import org.example.users.grpc.spec.User;
import org.example.users.grpc.spec.UserIdRequest;
import org.example.users.grpc.spec.UserRequest;
import org.example.users.grpc.spec.UsernameRequest;
import org.example.users.grpc.spec.UsersServiceGrpc;
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceBlockingStub;
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceFutureStub;
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceStub;
import org.example.users.grpc.spec.VoidRequest;
import org.example.utils.requesthandler.ClientGrpcInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

public class AbstractUsersGrpcClient {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersGrpcClient.class);

	@Value("${org.example.users.host}")
	private String host;

	@Value("${org.example.users.grpcPort}")
	private int port;

	@Autowired
	private ClientGrpcInterceptor interceptor;

	protected ManagedChannel managedChannel;
	protected UsersServiceBlockingStub blockingStub;

	public void start() {
		// Server server = ServerBuilder.forPort(port).addService(new
		// UsersServiceGrpc.UsersServiceImplBase() {
		// @Override
		// public void addUser(UserRequest request, StreamObserver<OneUserResponse> responseObserver) {
		// responseObserver.onError(Status.INTERNAL.withDescription("Eggplant Xerxes Crybaby Overbite
		// Narwhal").asRuntimeException());
		// }
		// }).build().start();
		// managedChannel = ManagedChannelBuilder.forAddress(host, port).usePlaintext(true).build();

		managedChannel = ManagedChannelBuilder //
				.forAddress(host, port) //
				.usePlaintext(true) //
				.build();
		final Channel channel = ClientInterceptors.intercept(managedChannel, interceptor);
		blockingStub = UsersServiceGrpc.newBlockingStub(channel);
	}

	public void shutdown() throws InterruptedException {
		managedChannel.shutdown();
		managedChannel.awaitTermination(1, TimeUnit.SECONDS);
	}

	protected User addUserBlockingCall(User user) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			final OneUserResponse response = blockingStub.addUser(UserRequest.newBuilder().setUser(user).build());
			return response.getUser();
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected User updateUserBlockingCall(User user) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			final OneUserResponse response = blockingStub.addUser(UserRequest.newBuilder().setUser(user).build());
			return response.getUser();
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected void deleteUserBlockingCall(long id) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			blockingStub.deleteUser(UserIdRequest.newBuilder().setId(id).build());
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
	}

	protected User getUserByIdBlockingCall(long id) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			final OneUserResponse response = blockingStub.getUserById(UserIdRequest.newBuilder().setId(id).build());
			return response.getUser();
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected User getUserByUsernameBlockingCall(String username) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			final OneUserResponse response = blockingStub.getUserByUsername(UsernameRequest.newBuilder().setUsername(username).build());
			return response.getUser();
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected List<User> getAllUsersBlockingCall() {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			final MultipleUsersResponse response = blockingStub.getAllUsers(VoidRequest.newBuilder().build());
			return response.getUserList();
		} catch (Exception e) {
			final Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected void addUserFutureCallDirect() {
		final UsersServiceFutureStub stub = UsersServiceGrpc.newFutureStub(managedChannel);
		final ListenableFuture<OneUserResponse> response =
				stub.addUser(UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build());

		try {
			response.get();
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			throw new RuntimeException(e);
		} catch (ExecutionException e) {
			final Status status = Status.fromThrowable(e.getCause());
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Xerxes"));
			// Cause is not transmitted over the wire.
		}
	}

	protected void addUserFutureCallCallback() {
		final UsersServiceFutureStub stub = UsersServiceGrpc.newFutureStub(managedChannel);
		final ListenableFuture<OneUserResponse> response =
				stub.addUser(UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build());

		final CountDownLatch latch = new CountDownLatch(1);

		// final Futures.addCallback(response, new FutureCallback<OneUserResponse>() {
		// @Override
		// public void onSuccess(@Nullable OneUserResponse result) {
		// // Won"t be called, since the server in this example always fails.
		// }
		//
		// @Override
		// public void onFailure(Throwable t) {
		// final Status status = Status.fromThrowable(t);
		// Verify.verify(status.getCode() == Status.Code.INTERNAL);
		// Verify.verify(status.getDescription().contains("Crybaby"));
		// // Cause is not transmitted over the wire..
		// latch.countDown();
		// }
		// }, directExecutor());

		if (!Uninterruptibles.awaitUninterruptibly(latch, 1, TimeUnit.SECONDS)) {
			throw new RuntimeException("timeout!");
		}
	}

	protected void addUserAsyncCall() {
		final UsersServiceStub stub = UsersServiceGrpc.newStub(managedChannel);
		final UserRequest request = UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build();
		final CountDownLatch latch = new CountDownLatch(1);
		final StreamObserver<OneUserResponse> responseObserver = new StreamObserver<OneUserResponse>() {
			@Override
			public void onNext(OneUserResponse value) {
				// Won"t be called.
			}

			@Override
			public void onError(Throwable t) {
				final Status status = Status.fromThrowable(t);
				Verify.verify(status.getCode() == Status.Code.INTERNAL);
				Verify.verify(status.getDescription().contains("Overbite"));
				// Cause is not transmitted over the wire..
				latch.countDown();
			}

			@Override
			public void onCompleted() {
				// Won"t be called, since the server in this example always fails.
			}
		};
		stub.addUser(request, responseObserver);

		if (!Uninterruptibles.awaitUninterruptibly(latch, 1, TimeUnit.SECONDS)) {
			throw new RuntimeException("timeout!");
		}
	}

	/**
	 * This is more advanced and does not make use of the stub. You should not normally need to do this,
	 * but here is how you would.
	 */
	protected void addUserAdvancedAsyncCall() {
		final ClientCall<UserRequest, OneUserResponse> call = managedChannel.newCall(UsersServiceGrpc.METHOD_ADD_USER, CallOptions.DEFAULT);
		final CountDownLatch latch = new CountDownLatch(1);

		call.start(new ClientCall.Listener<OneUserResponse>() {
			@Override
			public void onClose(Status status, Metadata trailers) {
				Verify.verify(status.getCode() == Status.Code.INTERNAL);
				Verify.verify(status.getDescription().contains("Narwhal"));
				// Cause is not transmitted over the wire.
				latch.countDown();
			}
		}, new Metadata());

		call.sendMessage(UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Marge").build()).build());
		call.halfClose();

		if (!Uninterruptibles.awaitUninterruptibly(latch, 1, TimeUnit.SECONDS)) {
			throw new RuntimeException("timeout!");
		}
	}

}

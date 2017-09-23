package org.example.users.grpc.client

import com.google.common.base.Verify
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import com.google.common.util.concurrent.ListenableFuture
import com.google.common.util.concurrent.Uninterruptibles
import io.grpc.CallOptions
import io.grpc.Channel
import io.grpc.ClientCall
import io.grpc.ClientInterceptors
import io.grpc.ManagedChannel
import io.grpc.ManagedChannelBuilder
import io.grpc.Metadata
import io.grpc.Status
import io.grpc.stub.StreamObserver
import java.util.List
import java.util.concurrent.CountDownLatch
import java.util.concurrent.ExecutionException
import java.util.concurrent.TimeUnit
import javax.annotation.Nullable
import org.example.users.grpc.spec.MultipleUsersResponse
import org.example.users.grpc.spec.OneUserResponse
import org.example.users.grpc.spec.User
import org.example.users.grpc.spec.UserIdRequest
import org.example.users.grpc.spec.UserRequest
import org.example.users.grpc.spec.UsernameRequest
import org.example.users.grpc.spec.UsersServiceGrpc
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceBlockingStub
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceFutureStub
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceStub
import org.example.users.grpc.spec.VoidRequest
import org.example.utils.requesthandler.ClientGrpcInterceptor
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value

import static com.google.common.util.concurrent.MoreExecutors.directExecutor

class AbstractUsersGrpcClient {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractUsersGrpcClient)

	@Value("${org.example.users.host}")
	private String host;

	@Value("${org.example.users.grpcPort}")
	private int port;

	@Autowired
	private ClientGrpcInterceptor interceptor;

	protected ManagedChannel managedChannel;
	protected UsersServiceBlockingStub blockingStub;
	
	public def void start() {
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
		val Channel channel = ClientInterceptors.intercept(managedChannel, interceptor);
		blockingStub = UsersServiceGrpc.newBlockingStub(channel);
	}

	public def void shutdown() throws InterruptedException {
		managedChannel.shutdown();
		managedChannel.awaitTermination(1, TimeUnit.SECONDS);
	}
	
	protected def User addUserBlockingCall(User user) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			val OneUserResponse response = blockingStub.addUser(UserRequest.newBuilder().setUser(user).build());
			return response.getUser();
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected def User updateUserBlockingCall(User user) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			val OneUserResponse response = blockingStub.addUser(UserRequest.newBuilder().setUser(user).build());
			return response.getUser();
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected def void deleteUserBlockingCall(long id) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			blockingStub.deleteUser(UserIdRequest.newBuilder().setId(id).build());
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
	}

	protected def User getUserByIdBlockingCall(long id) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			val OneUserResponse response = blockingStub.getUserById(UserIdRequest.newBuilder().setId(id).build());
			return response.getUser();
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected def User getUserByUsernameBlockingCall(String username) {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			val OneUserResponse response = blockingStub.getUserByUsername(UsernameRequest.newBuilder().setUsername(username).build());
			return response.getUser();
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected def List<User> getAllUsersBlockingCall() {
		// UsersServiceBlockingStub stub = UsersServiceGrpc.newBlockingStub(managedChannel);
		try {
			val MultipleUsersResponse response = blockingStub.getAllUsers(VoidRequest.newBuilder().build());
			return response.getUserList();
		} catch (Exception e) {
			val Status status = Status.fromThrowable(e);
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Eggplant"));
			// Cause is not transmitted over the wire.
		}
		return null;
	}

	protected def void addUserFutureCallDirect() {
		val UsersServiceFutureStub stub = UsersServiceGrpc.newFutureStub(managedChannel);
		val ListenableFuture<OneUserResponse> response =
				stub.addUser(UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build());

		try {
			response.get();
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			throw new RuntimeException(e);
		} catch (ExecutionException e) {
			val Status status = Status.fromThrowable(e.getCause());
			Verify.verify(status.getCode() == Status.Code.INTERNAL);
			Verify.verify(status.getDescription().contains("Xerxes"));
			// Cause is not transmitted over the wire.
		}
	}

	protected def void addUserFutureCallCallback() {
		val UsersServiceFutureStub stub = UsersServiceGrpc.newFutureStub(managedChannel);
		val ListenableFuture<OneUserResponse> response =
				stub.addUser(UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build());

		val CountDownLatch latch = new CountDownLatch(1);

		Futures.addCallback(response, new FutureCallback<OneUserResponse>() {
			override onSuccess(@Nullable OneUserResponse result) {
				// Won"t be called, since the server in this example always fails.
			}
			
			override onFailure(Throwable t) {
				val Status status = Status.fromThrowable(t);
				Verify.verify(status.getCode() == Status.Code.INTERNAL);
				Verify.verify(status.getDescription().contains("Crybaby"));
				// Cause is not transmitted over the wire..
				latch.countDown();
			}
		}, directExecutor());

		if (!Uninterruptibles.awaitUninterruptibly(latch, 1, TimeUnit.SECONDS)) {
			throw new RuntimeException("timeout!");
		}
	}

	protected def void addUserAsyncCall() {
		val UsersServiceStub stub = UsersServiceGrpc.newStub(managedChannel);
		val UserRequest request = UserRequest.newBuilder().setUser(User.newBuilder().setUsername("Bart").build()).build();
		val CountDownLatch latch = new CountDownLatch(1);
		val StreamObserver<OneUserResponse> responseObserver = new StreamObserver<OneUserResponse>() {
			override onNext(OneUserResponse value) {
				// Won"t be called.
			}
			
			override onError(Throwable t) {
				val Status status = Status.fromThrowable(t);
				Verify.verify(status.getCode() == Status.Code.INTERNAL);
				Verify.verify(status.getDescription().contains("Overbite"));
				// Cause is not transmitted over the wire..
				latch.countDown();
			}

			override onCompleted() {
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
	protected def void addUserAdvancedAsyncCall() {
		val ClientCall<UserRequest, OneUserResponse> call = managedChannel.newCall(UsersServiceGrpc.METHOD_ADD_USER, CallOptions.DEFAULT);

		val CountDownLatch latch = new CountDownLatch(1);

		call.start(new ClientCall.Listener<OneUserResponse>() {
		 override onClose(Status status, Metadata trailers) {
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

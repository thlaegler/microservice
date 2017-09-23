package org.example.users.grpc.server;

import io.grpc.stub.StreamObserver;
import org.example.users.business.UsersService;
import org.example.users.grpc.UsersGrpcModelConverter;
import org.example.users.grpc.spec.MultipleUsersResponse;
import org.example.users.grpc.spec.OneUserResponse;
import org.example.users.grpc.spec.UserIdRequest;
import org.example.users.grpc.spec.UserRequest;
import org.example.users.grpc.spec.UsernameRequest;
import org.example.users.grpc.spec.UsersServiceGrpc.UsersServiceImplBase;
import org.example.users.grpc.spec.VoidRequest;
import org.example.users.grpc.spec.VoidResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UsersGrpcServiceImpl extends UsersServiceImplBase {

	private static final Logger LOG = LoggerFactory.getLogger(UsersGrpcServiceImpl.class);

	@Autowired
	private UsersGrpcModelConverter convert;

	@Autowired
	private UsersService service;

	@Override
	public void addUser(UserRequest request, StreamObserver<OneUserResponse> responseObserver) {
		LOG.trace("addUser({}) called", request.getUser().getUsername());

		org.example.users.model.entity.User user = service.addUser(convert.toEntityModel(request.getUser()));
		OneUserResponse response = OneUserResponse.newBuilder().setUser(convert.toGrpcModel(user)).build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

	@Override
	public void updateUser(UserRequest request, StreamObserver<OneUserResponse> responseObserver) {
		LOG.trace("updateUser({}) called", request.getUser().getUsername());

		org.example.users.model.entity.User user = service.updateUser(convert.toEntityModel(request.getUser()));
		OneUserResponse response = OneUserResponse.newBuilder().setUser(convert.toGrpcModel(user)).build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

	@Override
	public void deleteUser(UserIdRequest request, StreamObserver<VoidResponse> responseObserver) {
		LOG.trace("deleteUser({}) called", request.getId());

		service.deleteUser(request.getId());
		VoidResponse response = VoidResponse.newBuilder().build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

	@Override
	public void getUserById(UserIdRequest request, StreamObserver<OneUserResponse> responseObserver) {
		LOG.trace("getUserById({}) called", request.getId());

		org.example.users.model.entity.User user = service.getUserById(request.getId());
		OneUserResponse response = OneUserResponse.newBuilder().setUser(convert.toGrpcModel(user)).build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

	@Override
	public void getUserByUsername(UsernameRequest request, StreamObserver<OneUserResponse> responseObserver) {
		LOG.trace("deleteUser({}) called", request.getUsername());

		org.example.users.model.entity.User user = service.getUserByUsername(request.getUsername());
		OneUserResponse response = OneUserResponse.newBuilder().setUser(convert.toGrpcModel(user)).build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

	@Override
	public void getAllUsers(VoidRequest request, StreamObserver<MultipleUsersResponse> responseObserver) {
		LOG.trace("Request all users");

		List<org.example.users.model.entity.User> users = service.getAllUsers();
		MultipleUsersResponse response = MultipleUsersResponse.newBuilder().addAllUser(convert.toGrpcModel(users)).build();

		responseObserver.onNext(response);
		responseObserver.onCompleted();
	}

}

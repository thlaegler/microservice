package org.example.users.grpc;

import org.example.users.grpc.spec.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UsersGrpcModelConverter {

	public User toGrpcModel(org.example.users.model.entity.User u) {
		return User.newBuilder()//
				.setId(u.getId())//
				.setUsername(u.getUsername())//
				.setEmail(u.getEmail())//
				.build();
	}

	public List<User> toGrpcModel(List<org.example.users.model.entity.User> us) {
		final List<User> users = new ArrayList<>();
		us.forEach(u -> users.add(toGrpcModel(u)));
		return users;
	}

	public org.example.users.model.entity.User toEntityModel(User u) {
		org.example.users.model.entity.User user = new org.example.users.model.entity.User();
		user.setId(u.getId());
		user.setUsername(u.getUsername());
		user.setEmail(u.getEmail());
		return user;
	}

	public List<org.example.users.model.entity.User> toEntityModel(List<User> us) {
		final List<org.example.users.model.entity.User> users = new ArrayList<>();
		us.forEach(u -> users.add(toEntityModel(u)));
		return users;
	}


}

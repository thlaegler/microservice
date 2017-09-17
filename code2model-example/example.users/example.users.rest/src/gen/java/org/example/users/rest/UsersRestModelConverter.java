package org.example.users.rest;

import org.example.users.rest.model.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UsersRestModelConverter {

	public User toRestModel(org.example.users.model.entity.User u) {
		return User.builder().build();
	}

	public List<User> toRestModel(List<org.example.users.model.entity.User> us) {
		List<User> users = new ArrayList<>();
		us.forEach(u -> users.add(toRestModel(u)));
		return users;
	}

	public org.example.users.model.entity.User toEntityModel(User u) {
		org.example.users.model.entity.User user = new org.example.users.model.entity.User();
		user.setId(u.getUserId());
		user.setUsername(u.getUsername());
		user.setEmail(u.getEmail());
		return user;
	}

	public List<org.example.users.model.entity.User> toEntityModel(List<User> us) {
		List<org.example.users.model.entity.User> users = new ArrayList<>();
		us.forEach(u -> users.add(toEntityModel(u)));
		return users;
	}
}

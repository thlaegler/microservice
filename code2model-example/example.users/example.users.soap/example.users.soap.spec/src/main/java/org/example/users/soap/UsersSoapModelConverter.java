package org.example.users.soap;

import org.example.types.users.ObjectFactory;
import org.example.types.users.User;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Component
public class UsersSoapModelConverter {

	protected static ObjectFactory SOAP_MODEL = new ObjectFactory();

	public User toSoapModel(org.example.users.model.entity.User u) {
		User user = SOAP_MODEL.createUser();
		user.setId(BigInteger.valueOf(u.getId()));
		user.setUsername(u.getUsername());
		user.setEmail(u.getEmail());
		user.setFirstName("");
		user.setLastName("");
		return user;
	}

	public org.example.users.model.entity.User toEntityModel(User u) {
		org.example.users.model.entity.User user = new org.example.users.model.entity.User();
		user.setId(u.getId().longValue());
		user.setUsername(u.getUsername());
		user.setEmail(u.getEmail());
		return user;
	}

	public List<User> toSoapModel(List<org.example.users.model.entity.User> us) {
		List<User> users = new ArrayList<>();
		us.forEach(u -> users.add(toSoapModel(u)));
		return users;
	}

	public List<org.example.users.model.entity.User> toEntityModel(List<User> us) {
		List<org.example.users.model.entity.User> users = new ArrayList<>();
		us.forEach(u -> users.add(toEntityModel(u)));
		return users;
	}
}

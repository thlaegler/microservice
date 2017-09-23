package org.example.users.soap.client;

import org.example.users.model.entity.User;
import org.example.users.soap.UsersSoapModelConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UsersSoapClient extends AbstractUsersSoapClient {

	private static final Logger LOG = LoggerFactory.getLogger(UsersSoapClient.class);

	@Autowired
	private UsersSoapModelConverter convert;

	public User addUser(User u) {
		LOG.trace("addUser({}) called", u.getUsername());

		return convert.toEntityModel(super.addUser(convert.toSoapModel(u)));
	}
}

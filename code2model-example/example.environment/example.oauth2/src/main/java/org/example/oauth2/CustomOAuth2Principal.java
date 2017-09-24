package org.example.oauth2;

import com.google.common.collect.Lists;
import lombok.Data;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Data
public class CustomOAuth2Principal extends User {

	private static final long serialVersionUID = 1L;

	private String userId;
	private String groupId;
	private List<String> permissions;

	public CustomOAuth2Principal(String username, String password) {
		super(username, password, Lists.newArrayList());
	}

	public CustomOAuth2Principal(String username, String password, boolean mustResetPassword) {
		super(username, password, true, true, mustResetPassword, true, Lists.newArrayList());
	}
}

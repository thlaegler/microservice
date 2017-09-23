package org.example.oauth2;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import org.example.users.grpc.client.UsersGrpcClient;
import org.example.users.model.entity.User;
import org.example.utils.requesthandler.RequestMetadata;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.stereotype.Component;

@Component
public class OAuth2DetailsService implements ClientDetailsService, UserDetailsService {

	private static final Logger LOG = LoggerFactory.getLogger(OAuth2DetailsService.class);

	@Autowired
	private RequestMetadata requestMetadata;

	@Autowired
	private UsersGrpcClient usersGrpcClient;

	@Autowired
	private OAuth2ServerProperties properties;

	@Override
	public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {
		Preconditions.checkNotNull(clientId);

		BaseClientDetails details = new BaseClientDetails("my-client-id", "all", "all", properties.getSupportedGrantTypes(),
				"ROLE_CLIENT,ROLE_TRUSTED_CLIENT", "not-in-use");

		details.addAdditionalInformation("user_id", null);
		details.addAdditionalInformation("customer_id", null);
		details.addAdditionalInformation("warehouse_id", null);

		// String secret = store.getStoreSecret();
		details.setClientSecret(properties.getClientSecret());

		requestMetadata.setTenant("my-tenant");

		// RequestMetadata requires the locale, but it's not really used in the case of OAuth2
		requestMetadata.setLocale("en-US");

		return details;
	}

	@Override
	public final UserDetails loadUserByUsername(final String username) {
		Preconditions.checkNotNull(username);

		User user = usersGrpcClient.getUserByUsername(username);

		org.springframework.security.core.userdetails.User oauthUser =
				new org.springframework.security.core.userdetails.User(username, user.getPassword(), true, true, false, true, Lists.newArrayList());

		return oauthUser;
	}

}

package org.example.oauth2.config;

import org.example.oauth2.CustomJwtAccessTokenConverter;
import org.example.oauth2.CustomOAuth2Principal;
import org.example.oauth2.OAuth2DetailsService;
import org.example.oauth2.OAuth2ServerProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.approval.TokenApprovalStore;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableAuthorizationServer
public class OAuth2ServerConfig extends AuthorizationServerConfigurerAdapter {

	private static final Logger LOG = LoggerFactory.getLogger(OAuth2ServerConfig.class);

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private OAuth2DetailsService detailsService;

	@Autowired
	private OAuth2ServerProperties properties;

	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		endpoints.authenticationManager(authenticationManager).tokenStore(tokenStore());

		endpoints//
				.tokenStore(tokenStore())//
				.tokenServices(tokenServices())//
				.authenticationManager(authenticationManager)//
				// .userDetailsService(userDetailsService)//
				.userDetailsService(detailsService)//
				// .userApprovalHandler(userApprovalHandler)//
				.accessTokenConverter(jwtTokenConverter())//
				.allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)//
				.reuseRefreshTokens(properties.isReuseRefreshToken());//
	}

	@Override
	public void configure(AuthorizationServerSecurityConfigurer oauthServer) throws Exception {
		oauthServer//
				.tokenKeyAccess("permitAll()")//
				.checkTokenAccess("permitAll()");
	}

	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		clients.withClientDetails(detailsService);
	}

	@Bean
	@Primary
	public AuthorizationServerTokenServices tokenServices() {
		TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
		tokenEnhancerChain.setTokenEnhancers(Arrays.asList(tokenEnhancer(), jwtTokenConverter()));

		DefaultTokenServices tokenServices = new DefaultTokenServices();
		tokenServices.setTokenStore(tokenStore());
		tokenServices.setSupportRefreshToken(properties.isSupportRefreshToken());
		tokenServices.setClientDetailsService(detailsService);
		tokenServices.setTokenEnhancer(tokenEnhancerChain);
		tokenServices.setRefreshTokenValiditySeconds(properties.getRefreshTokenValiditySeconds());
		tokenServices.setAccessTokenValiditySeconds(properties.getAccessTokenValiditySeconds());
		return tokenServices;
	}

	@Bean
	public TokenStore tokenStore() {
		// JWT Token
		JwtTokenStore tokenStore = new JwtTokenStore(jwtTokenConverter());
		return tokenStore;

		// Redis Token
		// RedisTokenStore tokenStore = new RedisTokenStore(connectionFactory());
		// tokenStore.setPrefix("oauth2");
		// return tokenStore;

		// In-memory
		// return new InMemoryTokenStore();
	}

	@Bean
	public TokenApprovalStore approvalStore() throws Exception {
		TokenApprovalStore store = new TokenApprovalStore();
		store.setTokenStore(tokenStore());
		return store;
	}

	@Bean
	public JwtAccessTokenConverter jwtTokenConverter() {
		JwtAccessTokenConverter converter = new CustomJwtAccessTokenConverter();
		converter.setSigningKey(properties.getJwtSigningKey());
		return converter;
	}

	@Bean
	public TokenEnhancer tokenEnhancer() {
		LOG.debug("Configuring Bean TokenEnhancer");

		return new TokenEnhancer() {
			@Override
			public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
				LOG.debug("Using Custom TokenEnhancer on access token {}", accessToken.toString());

				if (authentication.getUserAuthentication() != null && authentication.getUserAuthentication().getPrincipal() != null) {
					// Access token request. In case of refresh token request the principal might be just a String.
					if (authentication.getUserAuthentication().getPrincipal() instanceof CustomOAuth2Principal) {
						final Map<String, Object> additionalInfo = new HashMap<>();
						CustomOAuth2Principal principal = (CustomOAuth2Principal) authentication.getUserAuthentication().getPrincipal();

						final Map<String, Object> userProfile = new HashMap<>();

						userProfile.put("userId", principal.getUserId());
						userProfile.put("groupId", principal.getGroupId());
						userProfile.put("customerCode", principal.getCustomerCode());
						userProfile.put("warehouseCode", principal.getWarehouseCode());

						additionalInfo.put("userProfile", userProfile);

						((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
					}
				}

				return accessToken;
			}
		};
	}

}

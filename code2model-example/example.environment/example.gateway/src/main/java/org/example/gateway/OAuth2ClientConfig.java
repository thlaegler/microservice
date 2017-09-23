package org.example.gateway;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
// import org.springframework.security.oauth2.client.OAuth2RestOperations;
// import org.springframework.security.oauth2.client.OAuth2RestTemplate;
// import org.springframework.security.oauth2.client.token.AccessTokenRequest;
// import org.springframework.security.oauth2.client.token.DefaultAccessTokenRequest;
// import
// org.springframework.security.oauth2.client.token.grant.client.ClientCredentialsResourceDetails;
// import
// org.springframework.security.oauth2.client.token.grant.password.ResourceOwnerPasswordResourceDetails;
//
// import java.util.Arrays;
//
// @Configuration
// public class OAuth2ClientConfig {
//
// private static final Logger LOG = LoggerFactory.getLogger(OAuth2ClientConfig.class);
//
// @Value("${oauth.token:http://oauth2:8081/oauth/token}")
// private String tokenUrl;
//
// @Value("${oauth.clientId:test1}")
// private String clientId;
//
// @Value("${oauth.clientSecret:test}")
// private String clientSecret;
//
// @Value("${oauth.username:adminpaul}")
// private String username;
//
// @Value("${oauth.password:app133}")
// private String password;
//
// @Bean
// public ResourceOwnerPasswordResourceDetails resourceOwnerPasswordResourceDetails() {
// ResourceOwnerPasswordResourceDetails details = new ResourceOwnerPasswordResourceDetails();
// details.setScope(Arrays.asList("write", "read"));
// details.setAccessTokenUri(tokenUrl);
// details.setClientId(clientId);
// details.setClientSecret(clientSecret);
// details.setGrantType("password");
// details.setUsername(username);
// details.setPassword(password);
// return details;
// }
//
// @Bean
// public OAuth2RestOperations resourceOwnerPasswordResourceRestTemplate() {
// AccessTokenRequest atr = new DefaultAccessTokenRequest();
//
// return new OAuth2RestTemplate(resourceOwnerPasswordResourceDetails(), new
// DefaultOAuth2ClientContext(atr));
// }
//
// @Bean
// public ClientCredentialsResourceDetails clientCredentialsResourceDetails() {
// ClientCredentialsResourceDetails details = new ClientCredentialsResourceDetails();
// details.setScope(Arrays.asList("write", "read"));
// details.setAccessTokenUri(tokenUrl);
// details.setClientId(clientId);
// details.setClientSecret(clientSecret);
// details.setGrantType("password");
// return details;
// }
//
// @Bean
// public OAuth2RestOperations clientCredentialsResourceRestTemplate() {
// return new OAuth2RestTemplate(clientCredentialsResourceDetails(), new
// DefaultOAuth2ClientContext(new DefaultAccessTokenRequest()));
// }
// }

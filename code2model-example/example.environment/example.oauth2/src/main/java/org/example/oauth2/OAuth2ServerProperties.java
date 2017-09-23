package org.example.oauth2;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "security.oauth2.server")
public class OAuth2ServerProperties {

	private String clientSecret;
	private String supportedGrantTypes;
	private String jwtSigningKey;
	private int accessTokenValiditySeconds;
	private int refreshTokenValiditySeconds;
	private boolean supportRefreshToken;
	private boolean reuseRefreshToken;

}

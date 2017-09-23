package org.example.oauth2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.jwt.Jwt;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.security.jwt.crypto.sign.InvalidSignatureException;
import org.springframework.security.jwt.crypto.sign.MacSigner;
import org.springframework.security.jwt.crypto.sign.RsaSigner;
import org.springframework.security.jwt.crypto.sign.RsaVerifier;
import org.springframework.security.jwt.crypto.sign.SignatureVerifier;
import org.springframework.security.jwt.crypto.sign.Signer;
import org.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.DefaultOAuth2RefreshToken;
import org.springframework.security.oauth2.common.ExpiringOAuth2RefreshToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.oauth2.common.util.JsonParser;
import org.springframework.security.oauth2.common.util.JsonParserFactory;
import org.springframework.security.oauth2.common.util.RandomValueStringGenerator;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.AccessTokenConverter;
import org.springframework.security.oauth2.provider.token.DefaultAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * This is a customization of the Spring-provided JwtAccessTokenConverter. The purpose is, to encode
 * in the JWT token only the default values and keep all custom additional informations (user
 * profile) out of the encoded token.
 */
public class CustomJwtAccessTokenConverter extends JwtAccessTokenConverter {

	private static final Logger LOG = LoggerFactory.getLogger(CustomJwtAccessTokenConverter.class);

	private AccessTokenConverter tokenConverter = new DefaultAccessTokenConverter();

	private JsonParser objectMapper = JsonParserFactory.create();

	private String verifierKey = new RandomValueStringGenerator().generate();

	private Signer signer = new MacSigner(verifierKey);

	private String signingKey = verifierKey;

	private SignatureVerifier verifier;

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
		DefaultOAuth2AccessToken result = new DefaultOAuth2AccessToken(accessToken);
		Map<String, Object> info = new LinkedHashMap<String, Object>(accessToken.getAdditionalInformation());
		String tokenId = result.getValue();
		if (!info.containsKey(TOKEN_ID)) {
			info.put(TOKEN_ID, tokenId);
		} else {
			tokenId = (String) info.get(TOKEN_ID);
		}
		result.setAdditionalInformation(info);
		result.setValue(encode(result, authentication));
		OAuth2RefreshToken refreshToken = result.getRefreshToken();
		if (refreshToken != null) {
			DefaultOAuth2AccessToken encodedRefreshToken = new DefaultOAuth2AccessToken(accessToken);
			encodedRefreshToken.setValue(refreshToken.getValue());
			// Refresh tokens do not expire unless explicitly of the right type
			encodedRefreshToken.setExpiration(null);
			try {
				Map<String, Object> claims = objectMapper.parseMap(JwtHelper.decode(refreshToken.getValue()).getClaims());
				if (claims.containsKey(TOKEN_ID)) {
					encodedRefreshToken.setValue(claims.get(TOKEN_ID).toString());
				}
			} catch (IllegalArgumentException e) {
			}
			Map<String, Object> refreshTokenInfo = new LinkedHashMap<String, Object>(accessToken.getAdditionalInformation());
			refreshTokenInfo.put(TOKEN_ID, encodedRefreshToken.getValue());
			refreshTokenInfo.put(ACCESS_TOKEN_ID, tokenId);
			encodedRefreshToken.setAdditionalInformation(refreshTokenInfo);
			DefaultOAuth2RefreshToken token = new DefaultOAuth2RefreshToken(encode(encodedRefreshToken, authentication));
			if (refreshToken instanceof ExpiringOAuth2RefreshToken) {
				Date expiration = ((ExpiringOAuth2RefreshToken) refreshToken).getExpiration();
				encodedRefreshToken.setExpiration(expiration);
				token = new DefaultExpiringOAuth2RefreshToken(encode(encodedRefreshToken, authentication), expiration);
			}
			result.setRefreshToken(token);
		}
		return result;
	}

	@Override
	protected String encode(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
		String content;
		try {
			DefaultOAuth2AccessToken tempAccessToken = new DefaultOAuth2AccessToken(accessToken);
			Object jti = tempAccessToken.getAdditionalInformation().get(TOKEN_ID);
			Object accessTokenOfRefreshToken = tempAccessToken.getAdditionalInformation().get(ACCESS_TOKEN_ID);
			tempAccessToken.getAdditionalInformation().clear();
			tempAccessToken.getAdditionalInformation().put(TOKEN_ID, jti);
			if (accessTokenOfRefreshToken != null) {
				tempAccessToken.getAdditionalInformation().put(ACCESS_TOKEN_ID, accessTokenOfRefreshToken);
			}
			content = objectMapper.formatMap(tokenConverter.convertAccessToken(tempAccessToken, authentication));
		} catch (Exception e) {
			throw new IllegalStateException("Cannot convert access token to JSON", e);
		}
		String token = JwtHelper.encode(content, signer).getEncoded();
		return token;
	}

	@Override
	protected Map<String, Object> decode(String token) {
		try {
			Jwt jwt = JwtHelper.decodeAndVerify(token, verifier);
			String content = jwt.getClaims();
			Map<String, Object> map = objectMapper.parseMap(content);
			if (map.containsKey(EXP) && map.get(EXP) instanceof Integer) {
				Integer intValue = (Integer) map.get(EXP);
				map.put(EXP, new Long(intValue));
			}
			return map;
		} catch (Exception e) {
			throw new InvalidTokenException("Cannot convert access token to JSON", e);
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		if (verifier != null) {
			// Assume signer also set independently if needed
			return;
		}
		SignatureVerifier verifier = new MacSigner(verifierKey);
		try {
			verifier = new RsaVerifier(verifierKey);
		} catch (Exception e) {
			LOG.warn("Unable to create an RSA verifier from verifierKey (ignoreable if using MAC)");
		}
		// Check the signing and verification keys match
		if (signer instanceof RsaSigner) {
			byte[] test = "test".getBytes();
			try {
				verifier.verify(test, signer.sign(test));
				LOG.info("Signing and verification RSA keys match");
			} catch (InvalidSignatureException e) {
				LOG.error("Signing and verification RSA keys do not match");
			}
		} else if (verifier instanceof MacSigner) {
			// Avoid a race condition where setters are called in the wrong order. Use of
			// == is intentional.
			Assert.state(this.signingKey == this.verifierKey,
					"For MAC signing you do not need to specify the verifier key separately, and if you do it must match the signing key");
		}
		this.verifier = verifier;
	}

}

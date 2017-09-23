package features.oauth2;

import static org.junit.Assert.assertEquals;

import features.AbstractTestMethods;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

@Data
public class OAuth2FeatureMethods extends AbstractTestMethods {

	public static final Logger LOG = LoggerFactory.getLogger(OAuth2FeatureMethods.class);

	private static final String BASE_PATH = "/platform-oauth2";

	@Override
	public String getBasePath() {
		return BASE_PATH;
	}

	public String obtainAccessTokenByUsernamePassword(String clientId, String username, String password) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("grant_type", "password");
		params.put("client_id", clientId);
		params.put("username", username);
		params.put("password", password);

		response(req()//
				.auth()//
				.preemptive()//
				.basic(getStore(), getClientSecret())//
				.header("Authorization", "Basic 1234")//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/token"));
		assertEquals(200, resp().getStatusCode());

		setRefreshToken(resp().jsonPath().getString("refresh_token"));
		setAccessToken(resp().jsonPath().getString("access_token"));

		return getAccessToken();
	}

	public String obtainAccessTokenByRefreshToken(String clientId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("grant_type", "refresh_token");
		params.put("client_id", clientId);
		params.put("refresh_token", getRefreshToken());

		response(req()//
				.auth()//
				.preemptive()//
				.basic(getStore(), getClientSecret())//
				.header("Authorization", "Basic 1234")//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/token"));

		assertEquals(200, resp().getStatusCode());

		setAccessToken(resp().jsonPath().getString("access_token"));

		return getAccessToken();
	}

	public void authorizeClient(String clientId, String clientSecret) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("response_type", "code");
		params.put("client_id", clientId);
		params.put("scope", "user");

		response(req()//
				.auth()//
				.preemptive()//
				.basic(getStore(), getClientSecret())//
				.header("Authorization", "Basic 1234")//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/authorize"));
		assertEquals(200, resp().getStatusCode());
	}

	// @Test
	public void givenUser_whenRevokeRefreshToken_thenRefreshTokenInvalidError() {
		String accessTokenUser = obtainAccessTokenByUsernamePassword(getStore(), getUsername(), getUsername());
		authorizeClient(getStore(), getClientSecret());

		String accessTokenClient = obtainAccessTokenByRefreshToken(getStore());
		authorizeClient(getStore(), getClientSecret());
		response(req()//
				.header("Authorization", "Bearer " + accessTokenClient)//
				.get("/tokens"));
		assertEquals(200, resp().getStatusCode());

		response(req()//
				.header("Authorization", "Bearer " + accessTokenUser).post("/tokens/revokeRefreshToken/" + getRefreshToken()));
		assertEquals(200, resp().getStatusCode());

		String accessToken4 = obtainAccessTokenByRefreshToken(getStore());
		authorizeClient(getStore(), getClientSecret());
		response(req()//
				.header("Authorization", "Bearer " + accessToken4)//
				.get("/tokens"));
		assertEquals(401, resp().getStatusCode());
	}

	public void verifyHttpCode(int httpCode) {
		assertEquals("Wrong HTTP Code! Expected: " + httpCode + " but was: " + resp().getStatusCode(), httpCode, resp().getStatusCode());
	}

}

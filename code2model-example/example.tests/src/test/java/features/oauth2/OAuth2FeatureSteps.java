package features.oauth2;

import static org.junit.Assert.assertNotNull;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OAuth2FeatureSteps {

	protected static final Logger LOG = LoggerFactory.getLogger(OAuth2FeatureSteps.class);

	private OAuth2FeatureMethods feature = new OAuth2FeatureMethods();

	@When("^the user authenticates with username and password$")
	public void when_the_user_authenticates_with_username_and_password() throws Throwable {
		LOG.debug("When the user authenticates with username and password");

		feature.obtainAccessTokenByUsernamePassword(feature.getStore(), feature.getUsername(), feature.getPassword());
	}

	@When("^the user authenticates with client id$")
	public void when_the_user_authenticates_with_client_id() throws Throwable {
		LOG.debug("When the store authenticates with client id");

		feature.authorizeClient(feature.getStore(), feature.getClientSecret());
	}

	@When("^the user authenticates with refresh token$")
	public void when_the_user_authenticates_with_refresh_token() throws Throwable {
		LOG.debug("When the store authenticates with refresh token");

		feature.obtainAccessTokenByRefreshToken(feature.getStore());
	}

	@When("^the user has a access token$")
	public void when_the_user_has_a_access_token() throws Throwable {
		feature.setAccessToken("VALID_ACCESS_TOKEN");
	}

	@When("^the user requests ([A-Za-z0-9\\.\\-\\_\\/]+)$")
	public void when_the_user_requests(String path) throws Throwable {
		feature.response(feature.req().basePath(path).get());
	}

	@When("^the user requests ([A-Za-z0-9\\.\\-\\_\\/]+) ([A-Za-z0-9\\.\\-\\_\\/]+)$")
	public void when_the_user_requests(String service, String path) throws Throwable {
		feature.response(feature.req().baseUri(service + "8080").basePath(path).get());
	}

	@Then("^the response should contain ([A-Za-z0-9\\.\\-\\_\\/]+)$")
	public void then_the_response_should_contain(String queryString) throws Throwable {
		LOG.debug("Then the response should contain 'queryString'");

		assertNotNull(feature.getAccessToken());
	}

	@Then("^the access token should be valid$")
	public void then_the_access_token_should_be_valid() throws Throwable {
		LOG.debug("Then the access token should be valid");

		// checkToken(getAccessToken());
	}

	@Then("^the response code should be (\\d+)$")
	public void then_the_response_code_should_be(int httpCode) throws Throwable {
		feature.verifyHttpCode(httpCode);
	}

}

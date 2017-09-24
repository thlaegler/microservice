package features.oauth2;

import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertNotNull;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

public class OAuth2FeatureSteps {

	protected static final Logger LOG = LoggerFactory.getLogger(OAuth2FeatureSteps.class);
	private static final String HOST = "example.oauth2";
	private static final String PORT = "8081";
	private static final String BASE_PATH = "/oauth";

	private OAuth2FeatureMethods feature;
	private Map<String, String> params;

	private RequestSpecification req;
	private Response resp;

	private String token;

	@Before
	public void before() {
		req = given().baseUri("http://" + HOST + ":" + PORT).basePath(BASE_PATH);
		feature = new OAuth2FeatureMethods();
		params = new HashMap<String, String>();
	}

	@Given("^is a client ID \"([^\"]*)\"$")
	public void given_is_a_client_ID(String clientId) throws Throwable {
		params.put("client_id", clientId);
	}

	@Given("^is a client ID \"([^\"]*)\" and a client secret \"([^\"]*)\"$")
	public void given_is_a_client_ID_and_a_client_secret(String clientId, String clientSecret) throws Throwable {
		params.put("grant_type", "client_credentials");
		params.put("client_id", clientId);
		params.put("username", clientSecret);
	}

	@Given("^is a user with username \"([^\"]*)\" and password \"([^\"]*)\"$")
	public void given_is_a_user_with_username_and_password(String username, String password) throws Throwable {
		params.put("grant_type", "password");
		params.put("username", username);
		params.put("password", password);
	}

	@Given("^is a refresh token \"([^\"]*)\"$")
	public void given_is_a_refresh_token(String refreshToken) throws Throwable {
		params.put("grant_type", "refresh_token");
		params.put("refresh_token", refreshToken);
	}

	@When("^the user requests a token by username and password$")
	public void when_the_user_requests_a_token_by_username_and_password() throws Throwable {
		resp = req//
				.auth()//
				.preemptive()//
				.basic(params.get("username"), params.get("password"))//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/token");
	}

	@When("^the client requests a token by client ID and client secret$")
	public void when_the_client_requests_a_token_by_client_ID_and_client_secret() throws Throwable {
		resp = req//
				.auth()//
				.preemptive()//
				.basic(params.get("client_id"), params.get("client_secret"))//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/token");
	}

	@When("^the client requests a access token by refresh token$")
	public void when_the_client_requests_a_access_token_by_refresh_token() throws Throwable {
		resp = req//
				.auth()//
				.preemptive()//
				.basic(params.get("username"), params.get("password"))//
				.and()//
				.with()//
				.params(params)//
				.when()//
				.post("/token");
	}

	@Then("^the response body should contain a valid access token$")
	public void then_the_response_body_should_contain_a_valid_access_token() throws Throwable {
		assertNotNull(resp.getBody().jsonPath().get("token"));
	}

}

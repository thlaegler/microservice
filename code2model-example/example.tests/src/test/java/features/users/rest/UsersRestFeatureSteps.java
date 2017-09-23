package features.users.rest;

import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import features.users.UsersFeatureMethods;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.example.users.rest.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UsersRestFeatureSteps {

	protected static final Logger LOG = LoggerFactory.getLogger(UsersRestFeatureSteps.class);

	private static final String HOST = "users";
	private static final String PORT = "8091";
	private static final String APP_PATH = "rest";
	private static final String BASE_PATH = "users";


	private UsersFeatureMethods feature = new UsersFeatureMethods();

	private RequestSpecification req;
	private Response resp;

	private String token;
	private User user;

	@Before
	public void init() {
		req = given().baseUri("http://" + HOST + ":" + PORT + "/" + APP_PATH).basePath(BASE_PATH);
	}

	@Given("^is a authorized user with username \"([^\"]*)\" and password \"([^\"]*)\"$")
	public void is_a_authorized_user_with_username_and_password(String username, String password) throws Throwable {
		token = feature.obtainAccessToken(username, password);
	}

	@Given("^is a User with username \"([^\"]*)\" and email \"([^\"]*)\"$")
	public void is_a_User_with_username_and_email(String username, String email) throws Throwable {
		user = User.builder().username(username).email(email).build();
	}

	@Given("^is a User with id (\\d+) and username \"([^\"]*)\" and email \"([^\"]*)\"$")
	public void is_a_User_with_id_and_username_and_email(int id, String username, String email) throws Throwable {
		user = User.builder().userId(Long.valueOf(id)).username(username).email(email).build();
	}

	@Given("^is a User with id (\\d+)$")
	public void is_a_User_with_id(int id) throws Throwable {
		user = User.builder().userId(Long.valueOf(id)).build();
	}

	@Given("^is a User with username \"([^\"]*)\"$")
	public void is_a_User_with_username(String username) throws Throwable {
		user = User.builder().username(username).build();
	}

	@When("^the authorized user adds the user$")
	public void the_authorized_user_adds_the_user() throws Throwable {
		resp = req.body(user).post("/");
	}

	@When("^the authorized user updates the user$")
	public void the_authorized_user_updates_the_user() throws Throwable {
		resp = req.body(user).put("/{id}", user.getUserId());
	}

	@When("^the authorized user deletes the user$")
	public void the_authorized_user_deletes_the_user() throws Throwable {
		resp = req.delete("/{id}", user.getUserId());
	}

	@When("^the authorized user requests the user by ID$")
	public void the_authorized_user_requests_the_user_by_ID() throws Throwable {
		resp = req.get("/{id}", user.getUserId());
	}

	@When("^the authorized user requests the user by username$")
	public void the_authorized_user_requests_the_user_by_username() throws Throwable {
		resp = req.get("/{username}", user.getUsername());
	}

	@When("^the authorized user requests all users$")
	public void the_authorized_user_requests_all_users() throws Throwable {
		resp = req.get();
	}

	@Then("^the response code should be (\\d+)$")
	public void the_response_body_should_contain_the_user(int statusCode) throws Throwable {
		assertEquals(resp.getStatusCode(), statusCode);
	}

	@Then("^the response body should contain the user$")
	public void the_response_body_should_contain_the_user() throws Throwable {
		assertEquals(resp.getBody().jsonPath().get("username"), user.getUsername());
	}

	@Then("^the response body should be empty$")
	public void the_response_body_should_be_empty() throws Throwable {
		assertNotNull(resp.getBody().jsonPath().get("username"), user.getUsername());
		assertEquals(resp.getBody().jsonPath().get("username"), user.getUsername());
	}

	@Then("^the response body should contain a list of users$")
	public void the_response_body_should_contain_a_list_of_users() throws Throwable {
		assertNotNull(resp.getBody().jsonPath().getList(".").get(0));
	}

}

package features.users;

import features.AbstractTestMethods;
import io.restassured.response.Response;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Data
public class UsersFeatureMethods extends AbstractTestMethods {

	private static final Logger LOG = LoggerFactory.getLogger(UsersFeatureMethods.class);

	private static final String BASE_PATH = "/users";

	@Override
	public String getBasePath() {
		return BASE_PATH;
	}

	public String usersId = "1";

	public String obtainAccessToken(String username, String password) {
		// TODO: Call OAuth2 service token endpoint
		return "123456";
	}

	// public users getusersFromIndex(Object queryString) {
	// LOG.info("getusersFromIndex({})", queryString);
	//
	// return usersSearchGet(queryString).body().as(users.class);
	// }

	public Response usersSearchGet(Object queryString) {
		LOG.info("usersSearchGet({})", queryString);

		response(req().when().get("/search/" + queryString));
		return resp();
	}

	// public users getusersFromDatabase(String usersId) {
	// LOG.info("getusersFromDatabase({})", usersId.toString());
	//
	// return usersGet(usersId).body().as(users.class);
	// }

	public Response usersGet(Object usersId) {
		LOG.info("usersGet({})", usersId.toString());

		response(req().when().get("/" + usersId));
		return resp();
	}

	// public void usersPut(users users) {
	// LOG.info("usersPut({})", users.toString());
	//
	// req().when().body(users).put();
	// }

	public void usersIndexPut() throws InterruptedException {
		LOG.info("usersPut()");

		req().when().put("/reindex");
		Thread.sleep(3000);
	}

	public void searchOptions(String searchOptions) {
		LOG.info("usersPut({})", searchOptions);

		// world.setSearchOptions(searchOptions);
	}

	public void modifyusersInDatabase(String usersId, String name) {
		LOG.info("modifyusersInDatabase({}, {})", usersId, name);

		// users = getusersFromDatabase(usersId);
		// users.setDescription(name);
		// usersPut(users);
	}

}

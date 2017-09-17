package features;

import static io.restassured.RestAssured.given;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.ResponseSpecification;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Data
public abstract class AbstractTestMethods {

	public static final Logger LOG = LoggerFactory.getLogger(AbstractTestMethods.class);

	private String cluster = System.getProperty("org.example.cluster");
	private String host = System.getProperty("org.example.host");
	private String store;
	private String locale;

	private String environment = "staging";
	private String clientSecret = "CLIENT_SECRET";
	private String accessToken = "TestAccessToken";
	private String refreshToken = "TestRefreshToken";
	private String username = "USERNAME";
	private String password = "PASSWORD";

	private RequestSpecification req;
	private ResponseSpecification respSpec;
	private Response resp;

	public abstract String getBasePath();

	public RequestSpecification req() {
		if (getReq() == null) {
			setReq(given().baseUri(host).basePath(getBasePath()).header("Accept-Language", getLocale()).header("X-XM-Store", getStore()));
		}
		return getReq();
	}

	public void setEnvStaging() {
		LOG.debug("Given is a env staging");
		setEnvironment("staging");
	}

	public void setStoreCloudQA() {
		LOG.debug("Given is a store CloudQA");
		setStore("cloudqa");
	}

	public void setLocaleEnUs() {
		LOG.debug("Given is a locale en-US");
		setLocale("en-US");
	}

	public void setStoreBatteriesExpert() {
		LOG.debug("Given is a store BatteriesExpert");
		setStore("test1.staging.xmsymphony.com");
	}

	public void setAdminPaul() {
		LOG.debug("Given is a admin user with name Paul");
		setUser("adminPaul", "app133");
	}

	public Response resp() {
		return resp;
	}

	public void response(Response resp) {
		this.resp = resp;
	}

	public void setUser(String username, String password) {
		LOG.debug("Given is a user with name and password");

		this.username = username;
		this.password = password;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

}

package features.gateway;

import static features.CucumberAnnotation.ANNOTATION_ENVIRONMENT_STAGING;
import static features.CucumberAnnotation.ANNOTATION_STORE_BATTERIESEXPERT;
import static features.CucumberAnnotation.ANNOTATION_STORE_CLOUDQA;
import static features.CucumberAnnotation.ANNOTATION_USER_PAUL;
import static features.CucumberAnnotation.GIVEN_ENVIRONMENT;
import static features.CucumberAnnotation.GIVEN_STORE;
import static features.CucumberAnnotation.GIVEN_USER_ADMIN;
import static features.CucumberAnnotation.GIVEN_USER_GUEST;
import static features.CucumberAnnotation.GIVEN_USER_PASSWORD;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import features.oauth2.OAuth2FeatureMethods;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GatewayFeatureSteps {

	private static final Logger LOG = LoggerFactory.getLogger(GatewayFeatureSteps.class);

	private OAuth2FeatureMethods feature = new OAuth2FeatureMethods();

	@Before(ANNOTATION_ENVIRONMENT_STAGING)
	public void before_set_environment_staging() {
		feature.setEnvStaging();
	}

	@Before(ANNOTATION_STORE_CLOUDQA)
	public void before_set_store_cloudqa() {
		feature.setStoreCloudQA();
	}

	@Before(ANNOTATION_STORE_BATTERIESEXPERT)
	public void before_set_store_batteries_expert() {
		feature.setStoreBatteriesExpert();
	}

	@Before(ANNOTATION_USER_PAUL)
	public void before_set_admin_paul() {
		feature.setAdminPaul();
	}

	@Given(GIVEN_ENVIRONMENT)
	public void given_is_an_environment_with_name_(String environment) throws Throwable {
		feature.setEnvironment(environment);
	}

	@Given(GIVEN_STORE)
	public void given_is_a_store_with_id_(String storeId) throws Throwable {
		feature.setStore(storeId);
		feature.setClientSecret("test");
	}

	@Given(GIVEN_USER_GUEST)
	public void given_is_a_guest_user() throws Throwable {
		feature.setUsername("guest");
	}

	@Given(GIVEN_USER_PASSWORD)
	public void given_is_a_user_with_name_and_password(String username, String password) throws Throwable {
		feature.setUser(username, password);
	}

	@Given(GIVEN_USER_ADMIN)
	public void given_is_a_admin_user_with_name_and_password(String username, String password) throws Throwable {
		feature.setUser(username, password);
	}

	@When("^the todo health$")
	public void checkHealth() throws Throwable {
		LOG.info("When the user triggers reindexing");

		// feature.healthzGet();
	}

}

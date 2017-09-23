package features;

public class CucumberAnnotation {

	public static final String ANNOTATION_ENVIRONMENT_STAGING = "@Staging";
	public static final String ANNOTATION_STORE_BATTERIESEXPERT = "@BatteriesExpert";
	public static final String ANNOTATION_STORE_CLOUDQA = "@CloudQA";
	public static final String ANNOTATION_USER_PAUL = "@Paul";
	public static final String ANNOTATION_LOCALE_EN_US = "@enUS";

	public static final String GIVEN_ENVIRONMENT = "^is an environment with name ([A-Za-z0-9\\.\\-\\_\\/]+)$";
	public static final String GIVEN_STORE = "^is a store with id ([A-Za-z0-9\\.\\-\\_\\/]+)$";
	public static final String GIVEN_USER_GUEST = "^is a guest user$";
	public static final String GIVEN_USER_PASSWORD =
			"^is a user with name ([A-Za-z0-9\\.\\-\\_\\/]+) and password ([A-Za-z0-9\\.\\-\\_\\/]+)$";
	public static final String GIVEN_USER_ADMIN =
			"^is a admin user with name ([A-Za-z0-9\\.\\-\\_\\/]+) and password ([A-Za-z0-9\\.\\-\\_\\/]+)$";

}

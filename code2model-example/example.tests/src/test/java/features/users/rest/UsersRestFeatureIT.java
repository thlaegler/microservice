package features.users.rest;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(//
		strict = true, //
		glue = "classpath:features/users/rest", //
		features = "src/test/resources/features/users/rest", //
		plugin = {//
				"pretty", //
				"html:target/cucumber/users.rest", //
				"json:target/cucumber/users.rest.json"//
		}//
)
public class UsersRestFeatureIT {

}

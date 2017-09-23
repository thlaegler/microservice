package features.users.soap;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(//
		strict = true, //
		glue = "classpath:features/users/soap", //
		features = "src/test/resources/features/users/soap", //
		plugin = {//
				"pretty", //
				"html:target/cucumber/users.soap", //
				"json:target/cucumber/users.soap.json"//
		}//
)
public class UsersSoapFeatureIT {

}

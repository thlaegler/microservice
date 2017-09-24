package features.oauth2;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(//
		strict = true, //
		glue = "classpath:features/oauth2", //
		features = "src/test/resources/features/oauth2", //
		plugin = {//
				"pretty", //
				"html:target/cucumber/oauth2", //
				"json:target/cucumber/oauth2.json"//
		}//
)
public class OAuth2FeatureIT {

}

package features.gateway;

import features.AbstractTestMethods;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Data
public class GatewayFeatureMethods extends AbstractTestMethods {

	public static final Logger LOG = LoggerFactory.getLogger(GatewayFeatureMethods.class);

	private static final String BASE_PATH = "/example.gateway";

	@Override
	public String getBasePath() {
		return BASE_PATH;
	}

}

package org.example.oauth2.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Arrays;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

	private static final Logger LOG = LoggerFactory.getLogger(SwaggerConfig.class);

	@Value("${spring.application.name}")
	private String artifactId;

	@Value("${org.example.users.version}")
	private String version;

	@Bean
	public Docket swaggerApi() {
		return new Docket(DocumentationType.SWAGGER_2)//
				.useDefaultResponseMessages(false)//
				.globalResponseMessage(RequestMethod.GET, Arrays.asList(//
						new ResponseMessageBuilder()//
								.code(500)//
								.message("Internal Server Error")//
								.responseModel(new ModelRef("Error"))//
								.build(),
						new ResponseMessageBuilder()//
								.code(400)//
								.message("Bad Credentials!")//
								.responseModel(new ModelRef("Error"))//
								.build(),
						new ResponseMessageBuilder()//
								.code(401)//
								.responseModel(new ModelRef("Error"))//
								.message("Unauthorized!")//
								.build(),
						new ResponseMessageBuilder()//
								.code(403)//
								.responseModel(new ModelRef("Error"))//
								.message("Forbidden!")//
								.build()))
				.apiInfo(apiInfo())//
				.groupName("org.example")//
				.select()//
				.apis(RequestHandlerSelectors.basePackage("org.springframework.security.oauth2.provider.endpoint"))//
				.paths(PathSelectors.any())//
				.build();
	}

	private ApiInfo apiInfo() {
		return new ApiInfo(artifactId.toUpperCase() + " REST API",
				"For more information see: https://www.example.org", version,
				"This is an example", swaggerContact(), "Apache Licence", "http://www.example.org");
	}

	private Contact swaggerContact() {
		return new Contact("Example Network", "http://www.example.or", "john.doe@example.or");
	}

}

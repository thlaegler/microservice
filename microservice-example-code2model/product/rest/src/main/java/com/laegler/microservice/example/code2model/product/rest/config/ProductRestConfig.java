package com.laegler.microservice.example.code2model.product.rest.config;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class ProductRestConfig {

  @Inject
  private Logger LOG;

  @Bean
  public Docket swaggerApi() {
    return new Docket(DocumentationType.SWAGGER_2).select().apis(RequestHandlerSelectors.any())
        .paths(PathSelectors.any()).build();
  }

  @Bean
  public UiConfiguration swaggerUiConfig() {
    return new UiConfiguration("validatorUrl", "none", "alpha", "schema",
        UiConfiguration.Constants.DEFAULT_SUBMIT_METHODS, true, true);
  }
}

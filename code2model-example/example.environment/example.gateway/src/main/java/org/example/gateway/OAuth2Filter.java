// package org.example.gateway;
//
// import com.fasterxml.jackson.core.JsonProcessingException;
// import com.fasterxml.jackson.databind.ObjectMapper;
// import com.netflix.zuul.ZuulFilter;
// import com.netflix.zuul.context.RequestContext;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.http.HttpMethod;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.MediaType;
// import org.springframework.http.ResponseEntity;
// import org.springframework.http.client.ClientHttpResponse;
// import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
// import org.springframework.stereotype.Component;
// import org.springframework.web.client.ResponseErrorHandler;
// import org.springframework.web.client.RestTemplate;
// import org.springframework.web.util.UriComponentsBuilder;
//
// import java.io.IOException;
// import java.util.Set;
//
// @Component
// public class OAuth2Filter extends ZuulFilter {
//
// private static final Logger LOG = LoggerFactory.getLogger(OAuth2Filter.class);
//
// @Autowired
// private ObjectMapper objectMapper;
//
// @Value("${org.example.oauth2.host}")
// private String host;
//
// @Value("${org.example.oauth2.port}")
// private int port;
//
// @Override
// public String filterType() {
// return "pre";
// }
//
// @Override
// public int filterOrder() {
// return 9999;
// }
//
// /**
// * Filter should apply for all requests except oauth requests which are just routed through to the
// * OAuth2 service
// */
// @Override
// public boolean shouldFilter() {
// RequestContext context = RequestContext.getCurrentContext();
// String requestUri = context.getRequest().getRequestURI();
// return !requestUri.contains("oauth");
// }
//
// @Override
// @SuppressWarnings("unchecked")
// public Object run() {
// LOG.debug("Request is passing OAuth2Filter");
//
// RequestContext context = RequestContext.getCurrentContext();
//
// // Alter ignored headers as per:
// // https://gitter.im/spring-cloud/spring-cloud?at=56fea31f11ea211749c3ed22
// Set<String> headers = (Set<String>) context.get("ignoredHeaders");
// headers.remove("authorization");
//
// ResponseEntity<String> response = getOAuth2Response();
//
// if (!response.getStatusCode().equals(HttpStatus.OK)) {
// try {
// LOG.warn("Not valid AccessToken.");
// context.getResponse().setContentType(MediaType.APPLICATION_JSON_VALUE);
// context.setResponseBody(objectMapper.writeValueAsString(ErrorResponse.builder().error("Unauthorized")
// .errorMessage("Access token is not valid. Login again or issue a new access token by refresh
// token.").build()));
// context.setResponseStatusCode(HttpStatus.UNAUTHORIZED.value());
// return null;
// } catch (JsonProcessingException e) {
// LOG.warn("Failed to create error response.");
// }
// }
//
// return null;
// }
//
// private ResponseEntity<String> getOAuth2Response() {
// RequestContext context = RequestContext.getCurrentContext();
//
// String authHeader = new String(context.getRequest().getHeader("Authorization"));
// String accessToken = authHeader.replaceFirst("Bearer ", "");
//
// RestTemplate restTemplate = new RestTemplate();
// restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
//
// // Prevent Spring from creating an exception on status code 400 (which is don by default by the
// // DefaultResponseErrorHandler). That would cause Zuul to break the routing and would hide the
// 400
// // and return status code 200. But we dont want to hide a 400 or 401.
// restTemplate.setErrorHandler(new ResponseErrorHandler() {
// @Override
// public boolean hasError(ClientHttpResponse response) throws IOException {
// return false;
// }
//
// @Override
// public void handleError(ClientHttpResponse response) throws IOException {
// // do nothing, or something
// }
// });
//
// String checkTokenUrl = new StringBuilder()//
// .append("http://")//
// .append(host)//
// .append(":")//
// .append(port)//
// .append("/oauth/check_token")//
// .toString();
// UriComponentsBuilder builder =
// UriComponentsBuilder.fromHttpUrl(checkTokenUrl).queryParam("token", accessToken);
//
// ResponseEntity<String> response = restTemplate.exchange(builder.build().encode().toUri(),
// HttpMethod.POST, null, String.class);
//
// return response;
// }
//
// }

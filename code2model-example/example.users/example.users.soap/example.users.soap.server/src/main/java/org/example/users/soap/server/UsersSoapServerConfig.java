package org.example.users.soap.server;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ws.config.annotation.EnableWs;
import org.springframework.ws.wsdl.wsdl11.Wsdl11Definition;

@EnableWs
@Configuration
public class UsersSoapServerConfig extends AbstractUsersSoapServerConfig {

	@Bean
	@Override
	public ServletRegistrationBean messageDispatcherServlet(ApplicationContext ctx) {
		return super.messageDispatcherServlet(ctx);
	}

	@Bean(name = "users")
	@Override
	public Wsdl11Definition defaultWsdl11Definition() {
		return super.defaultWsdl11Definition();
	}
}

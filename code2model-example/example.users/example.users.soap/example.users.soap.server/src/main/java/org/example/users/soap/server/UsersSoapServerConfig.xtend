package org.example.users.soap.server

import org.springframework.boot.web.servlet.ServletRegistrationBean
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.ws.config.annotation.EnableWs
import org.springframework.ws.wsdl.wsdl11.Wsdl11Definition

@EnableWs
@Configuration
class UsersSoapServerConfig extends AbstractUsersSoapServerConfig {

	@Bean
	override ServletRegistrationBean messageDispatcherServlet(ApplicationContext ctx) {
		super.messageDispatcherServlet(ctx)
	}

	@Bean(name='users')
	override Wsdl11Definition defaultWsdl11Definition() {
		super.defaultWsdl11Definition
	}
}

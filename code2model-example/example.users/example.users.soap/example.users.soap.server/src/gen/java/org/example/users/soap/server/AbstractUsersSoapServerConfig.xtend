package org.example.users.soap.server

import org.springframework.boot.web.servlet.ServletRegistrationBean
import org.springframework.context.ApplicationContext
import org.springframework.core.io.ClassPathResource
import org.springframework.ws.config.annotation.WsConfigurerAdapter
import org.springframework.ws.transport.http.MessageDispatcherServlet
import org.springframework.ws.wsdl.wsdl11.SimpleWsdl11Definition
import org.springframework.ws.wsdl.wsdl11.Wsdl11Definition

public class AbstractUsersSoapServerConfig extends WsConfigurerAdapter {

	protected def ServletRegistrationBean messageDispatcherServlet(ApplicationContext applicationContext) {
		val MessageDispatcherServlet servlet = new MessageDispatcherServlet
		servlet.setApplicationContext(applicationContext)
		new ServletRegistrationBean(servlet, '/ws/*')
	}

	protected def Wsdl11Definition defaultWsdl11Definition() {
		val SimpleWsdl11Definition wsdl11Definition = new SimpleWsdl11Definition
		wsdl11Definition.setWsdl(new ClassPathResource('users.wsdl'))
		wsdl11Definition
	}
}

package com.laegler.microservice.codegen.template.microservice.webapp

import com.laegler.microservice.codegen.template.utils.AbstractXmlTemplate
import com.laegler.microservice.codegen.model.Microservice

/**
 * File Generator for Web project descriptor.
 */
class WebXmlTemplateBase extends AbstractXmlTemplate {

	new(Microservice m) {
		super(m)
		fileName = 'web'
		relativPath = '/src/main/webapp/META-INF/'
		header = '''
			<?xml version="1.0" encoding="UTF-8"?>
			<web-app
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns="http://java.sun.com/xml/ns/javaee"
				xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
					http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
				version="3.0">
		'''
		footer = '</web-app>'
		documentation = 'Web project descriptor'

		content = template
	}

	private def String getTemplate() '''
		<display-name>pmbok-web</display-name>
		<description>The WebApp Project. Containing Servlets and Filters, Security and Roles, Session and Cookie Timeouts and much more :)</description>
		
		<welcome-file-list>
			<welcome-file>index.jsf</welcome-file>
		</welcome-file-list>
		
		<!-- Citysquire Faces Servlet -->
		<servlet>
			<servlet-name>CQFacesServlet</servlet-name>
			<servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
			<!-- <servlet-class>com.laegler.pmbok.web.servlet.CQFacesServlet</servlet-class> -->
			<load-on-startup>1</load-on-startup>
		</servlet>
		<servlet-mapping>
			<servlet-name>CQFacesServlet</servlet-name>
			<url-pattern>*.jsf</url-pattern>
			<url-pattern>*.xhtml</url-pattern>
			<url-pattern>*.html</url-pattern>
		</servlet-mapping>
		
		<!-- Citysquire Faces Filter -->
		<filter>
			<description>Citysquire Faces Filter</description>
			<display-name>Citysquire Faces Filter</display-name>
			<filter-name>CQFacesFilter</filter-name>
			<filter-class>com.laegler.pmbok.web.servlet.CQFacesFilter</filter-class>
		</filter>
		<filter-mapping>
			<filter-name>CQFacesFilter</filter-name>
			<url-pattern>*.jsf</url-pattern>
			<url-pattern>*.xhtml</url-pattern>
			<url-pattern>*.html</url-pattern>
			<servlet-name>CQUploadServlet</servlet-name>
		</filter-mapping>
		
		<!-- Upload Servlet -->
		<servlet>
			<servlet-name>CQUploadServlet</servlet-name>
			<servlet-class>com.laegler.pmbok.web.servlet.CQUploadServlet</servlet-class>
		</servlet>
		<servlet-mapping>
			<servlet-name>CQUploadServlet</servlet-name>
			<url-pattern>/upload/*</url-pattern>
		</servlet-mapping>
		
		<!-- Upload Filter -->
		<filter>
			<description>Custom citysquire file upload filter</description>
			<display-name>Custom citysquire file upload filter</display-name>
			<filter-name>CQUploadFilter</filter-name>
			<filter-class>com.laegler.pmbok.web.servlet.CQUploadFilter</filter-class>
			<init-param>
				<param-name>thresholdSize</param-name>
				<param-value>51200</param-value>
			</init-param>
			<init-param>
				<param-name>uploadDirectory</param-name>
				<param-value>D:\Users\thomas\Desktop</param-value>
			</init-param>
		</filter>
		<filter-mapping>
			<filter-name>CQUploadFilter</filter-name>
			<servlet-name>CQUploadServlet</servlet-name>
		</filter-mapping>
		
		<filter>
			<filter-name>WeldCrossContextFilter</filter-name>
			<filter-class>org.jboss.weld.servlet.WeldCrossContextFilter</filter-class>
		</filter>
		<filter-mapping>
			<filter-name>WeldCrossContextFilter</filter-name>
			<url-pattern>/*</url-pattern>
			<dispatcher>INCLUDE</dispatcher>
			<dispatcher>FORWARD</dispatcher>
			<dispatcher>ERROR</dispatcher>
		</filter-mapping>
		
		<!-- Context Parameters -->
		<context-param>
			<param-name>configuration</param-name>
			<param-value>deployment</param-value>
		</context-param>
		<context-param>
			<param-name>primefaces.UPLOADER</param-name>
			<param-value>commons</param-value>
		</context-param>
			<context-param>
			<param-name>upload.location</param-name>
			<param-value>/var/www/upload/</param-value>
		</context-param>
		<context-param>
			<description>State saving method (see JSF specification 2.5.2)</description>
			<param-name>javax.faces.STATE_SAVING_METHOD</param-name>
			<param-value>server</param-value>
		</context-param>
		<context-param>
			<description>Location of faces config</description>
			<param-name>javax.faces.application.CONFIG_FILES</param-name>
			<param-value>/WEB-INF/faces-config.xml</param-value>
		</context-param>
		<context-param>
			<description>Enable client side validation for Primefaces</description>
			<param-name>primefaces.CLIENT_SIDE_VALIDATION</param-name>
			<param-value>true</param-value>
		</context-param>
		<context-param>
			<description>Prevent rendering of comments in XHTML files (legacy: facelets.SKIP_COMMENTS)</description>
			<param-name>javax.faces.FACELETS_SKIP_COMMENTS</param-name>
			<param-value>true</param-value>
		</context-param>
		<context-param>
			<description>Custom citysquire facelet function taglib</description>
			<param-name>javax.faces.FACELETS_LIBRARIES</param-name>
			<param-value>/WEB-INF/cqFaceletFunctions.taglib.xml</param-value>
		</context-param>
		<context-param>
			<description>Specify Primefaces theming</description>
			<param-name>primefaces.THEME</param-name>
			<param-value>delta</param-value>
		</context-param>
		
		<!-- Session Config -->
		<session-config>
			<session-timeout>1000</session-timeout>
			<tracking-mode>COOKIE</tracking-mode>
		</session-config>
		
		<!-- Listener -->
		<listener>
			<display-name>Custom citysquire Servlet context listener</display-name>
			<listener-class>com.laegler.pmbok.web.servlet.CQServletContextListener</listener-class>
		</listener>
		
		<!-- Error Pages -->
		<error-page>
			<error-code>401</error-code>
			<location>/desktop/error-pages/401.xhtml</location>
		</error-page>
		<error-page>
			<error-code>404</error-code>
			<location>/desktop/error-pages/404.xhtml</location>
		</error-page>
		<error-page>
			<error-code>403</error-code>
			<location>/desktop/error-pages/403.xhtml</location>
		</error-page>
		<error-page>
			<exception-type>java.lang.Exception</exception-type>
			<location>/desktop/error-pages/error.xhtml</location>
		</error-page>
		
		<!-- Security -->
		<security-constraint>
			<display-name>SuperuserAccess</display-name>
			<web-resource-collection>
				<web-resource-name>SuperuserArea</web-resource-name>
				<url-pattern>/desktop/superuser/*</url-pattern>
				<url-pattern>/mobile/superuser/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser</description>
				<role-name>SUPERUSER</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>AdminAccess</display-name>
			<web-resource-collection>
				<web-resource-name>>AdminArea</web-resource-name>
				<url-pattern>/desktop/admin/*</url-pattern>
				<url-pattern>/mobile/admin/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Admin, Superuser</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>ManagementAccess</display-name>
			<web-resource-collection>
				<web-resource-name>ManagementArea</web-resource-name>
				<url-pattern>/desktop/management/*</url-pattern>
				<url-pattern>/mobile/management/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser, Admin, Management</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
				<role-name>MANAGEMENT</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>EnterpriseAccess</display-name>
			<web-resource-collection>
				<web-resource-name>SuperuserArea</web-resource-name>
				<url-pattern>/desktop/enterprise/*</url-pattern>
				<url-pattern>/mobile/enterprise/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser, Admin, Management,
								Enterprise</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
				<role-name>MANAGEMENT</role-name>
				<role-name>ENTERPRISE</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>ProviderAccess</display-name>
			<web-resource-collection>
				<web-resource-name>ProviderArea</web-resource-name>
				<url-pattern>/desktop/provider/*</url-pattern>
				<url-pattern>/mobile/provider/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser, Admin, Management,
								Provider</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
				<role-name>MANAGEMENT</role-name>
				<role-name>PROVIDER</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>EmployeeAccess</display-name>
			<web-resource-collection>
				<web-resource-name>ProviderArea</web-resource-name>
				<url-pattern>/desktop/employee/*</url-pattern>
				<url-pattern>/mobile/employee/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser, Admin, Management,
								Employee</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
				<role-name>MANAGEMENT</role-name>
				<role-name>EMPLOYEE</role-name>
			</auth-constraint>
		</security-constraint>
		<security-constraint>
			<display-name>GuestAccess</display-name>
			<web-resource-collection>
				<web-resource-name>GuestArea</web-resource-name>
				<url-pattern>/desktop/guest/*</url-pattern>
				<url-pattern>/mobile/guest/*</url-pattern>
				<http-method>GET</http-method>
				<http-method>POST</http-method>
			</web-resource-collection>
			<auth-constraint>
				<description>Constraint for Superuser, Admin, Management, Enterprise
				Provider, Employee</description>
				<role-name>SUPERUSER</role-name>
				<role-name>ADMIN</role-name>
				<role-name>MANAGEMENT</role-name>
				<role-name>ENTERPRISE</role-name>
				<role-name>PROVIDER</role-name>
				<role-name>EMPLOYEE</role-name>
				<role-name>GUEST</role-name>
			</auth-constraint>
		</security-constraint>
		
		<!-- Login Config -->
		<login-config>
			<auth-method>FORM</auth-method>
			<realm-name>citysquire Login</realm-name>
			<form-login-config>
				<form-login-page>/login.jsf</form-login-page>
				<form-error-page>/desktop/error-pages/error.jsf</form-error-page>
			</form-login-config>
		</login-config>
		
		<!-- User Roles -->
		<security-role>
			<description>Superuser</description>
			<role-name>SUPERUSER</role-name>
		</security-role>
		<security-role>
			<description>Admin</description>
			<role-name>ADMIN</role-name>
		</security-role>
		<security-role>
			<description>Management</description>
			<role-name>MANAGEMENT</role-name>
		</security-role>
		<security-role>
			<description>Enterprise</description>
			<role-name>ENTERPRISE</role-name>
		</security-role>
		<security-role>
			<description>Provider</description>
			<role-name>PROVIDER</role-name>
		</security-role>
		<security-role>
			<description>Employee</description>
			<role-name>EMPLOYEE</role-name>
		</security-role>
		<security-role>
			<description>Guest</description>
			<role-name>GUEST</role-name>
		</security-role>
		
		<!-- Mime-Mapping for custom fonts -->
		<mime-mapping>
			<extension>eot</extension>
			<mime-type>application/vnd.ms-fontobject</mime-type>
		</mime-mapping>
		<mime-mapping>
			<extension>ttf</extension>
			<mime-type>application/x-font-ttf</mime-type>
		</mime-mapping>
		<mime-mapping>
			<extension>woff</extension>
			<mime-type>application/font-woff</mime-type>
		</mime-mapping>
	'''

}

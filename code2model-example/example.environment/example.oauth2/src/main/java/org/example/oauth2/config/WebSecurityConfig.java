package org.example.oauth2.config;

import org.example.oauth2.OAuth2DetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@Order(-20)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private OAuth2DetailsService detailsService;

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(detailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http//
				.csrf()//
				.disable()//
				.requestMatchers()//
				.antMatchers("/login", "/oauth/authorize", "/oauth/confirm_access", "/oauth/check_token")//
				.and()//
				.authorizeRequests()//
				.antMatchers("/login", "/oauth/**")//
				.permitAll() //
				.anyRequest()//
				.authenticated();
	}

}

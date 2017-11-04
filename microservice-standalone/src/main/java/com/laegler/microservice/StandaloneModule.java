package com.laegler.microservice;

import com.google.inject.AbstractModule;
import com.laegler.microservice.adapter.util.DefaultNamingStrategy;
import com.laegler.microservice.adapter.util.NamingStrategy;

public class StandaloneModule extends AbstractModule {

	@Override
	protected void configure() {
		bind(NamingStrategy.class).to(DefaultNamingStrategy.class);
	}

}

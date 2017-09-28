package com.laegler.microservice;

import org.jboss.weld.environment.se.Weld;
import org.jboss.weld.environment.se.WeldContainer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CdiContext {

	private static final Logger LOG = LoggerFactory.getLogger(CdiContext.class);

	private final Weld weld;
	private final WeldContainer container;

	CdiContext() {
		this.weld = new Weld();
		this.container = weld.initialize();
		Runtime.getRuntime().addShutdownHook(new Thread() {
			@Override
			public void run() {
				weld.shutdown();
			}
		});
	}

	public <T> T getBean(Class<T> type) {
		return container.instance().select(type).get();
	}

}

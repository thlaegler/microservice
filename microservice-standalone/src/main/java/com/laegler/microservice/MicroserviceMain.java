package com.laegler.microservice;

import java.io.File;
import java.net.URISyntaxException;

import com.google.inject.Guice;
import com.google.inject.Injector;

public class MicroserviceMain {

	public static final CdiContext INSTANCE = new CdiContext();

	public static void main(String[] args) throws URISyntaxException {
		Injector injector = Guice.createInjector(new StandaloneModule());

		// MicroserviceLauncher launcher = INSTANCE.getBean(MicroserviceLauncher.class);
		MicroserviceLauncher launcher = injector.getInstance(MicroserviceLauncher.class);

		File basedir = null;
		if (args == null || args.length == 0 || args[0] == null || args[0].isEmpty()) {
			basedir = new File(
					MicroserviceMain.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath());
		} else {
			// basedir = new File(args[0]);
			basedir = new File(MicroserviceMain.class.getResource(args[0]).toURI());
		}

		launcher.launch(basedir);
	}

}

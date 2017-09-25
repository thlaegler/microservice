package com.laegler.microservice;

import java.io.File;
import java.net.URISyntaxException;

public class MicroserviceMain {

	public static void main(String[] args) throws URISyntaxException {
		MicroserviceLauncher launcher = new MicroserviceLauncher();

		File basedir = new File(MicroserviceMain.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath());

		launcher.launch(basedir);
	}

}

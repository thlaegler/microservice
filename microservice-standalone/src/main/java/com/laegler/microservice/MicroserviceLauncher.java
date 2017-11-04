package com.laegler.microservice;

import java.io.File;

import javax.inject.Inject;

import com.laegler.microservice.code2model.Code2ModelTransformator;
import com.laegler.microservice.model2code.Model2CodeTransformator;

public class MicroserviceLauncher {

	@Inject
	private Model2CodeTransformator model2code;

	@Inject
	private Code2ModelTransformator code2model;

	MicroserviceLauncher() {
	}

	public void launch(File basedir) {
		model2code.generate(basedir);
	}
}

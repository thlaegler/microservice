package com.laegler.microservice;

import com.laegler.microservice.code2model.Code2ModelTransformator;
import com.laegler.microservice.model2code.Model2CodeTransformator;
import org.slf4j.Logger;

import java.io.File;

import javax.inject.Inject;

public class MicroserviceLauncher {

	@Inject
	private Logger LOG;

	@Inject
	private Model2CodeTransformator model2code;

	@Inject
	private Code2ModelTransformator code2model;

	MicroserviceLauncher() {}

	public void launch(File basedir) {
		model2code.generate(basedir);
	}
}

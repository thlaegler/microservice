package com.laegler.microservice;

import java.io.File;

import javax.inject.Inject;
import javax.inject.Named;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.laegler.microservice.code2model.Code2ModelTransformator;
import com.laegler.microservice.model2code.Model2CodeTransformator;

@Named
public class MicroserviceLauncher {
	private static final Logger LOG = LoggerFactory.getLogger(MicroserviceLauncher.class);

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

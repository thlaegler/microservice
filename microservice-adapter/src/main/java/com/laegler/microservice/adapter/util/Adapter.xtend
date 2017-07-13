package com.laegler.microservice.adapter.util

import java.util.Map
import com.laegler.microservice.adapter.model.Project
import javax.inject.Inject
import org.slf4j.LoggerFactory
import org.slf4j.Logger
import com.laegler.microservice.adapter.model.World

abstract class Adapter<T> {

	protected static final Logger LOG = LoggerFactory.getLogger(Adapter)

	@Inject protected World world
	@Inject protected FileUtil fileHelper

	public def T parse(String fileLocation)

	public def String generate(Project project, String fileLocation)

	public def String generate(Project project, String fileLocation, Map<String, Object> params)

}

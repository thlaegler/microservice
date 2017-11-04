package com.laegler.microservice.maven.plugin

import com.itemis.maven.plugins.cdi.logging.MavenLogWrapper
import javax.inject.Inject
import javax.inject.Named
import org.apache.log4j.BasicConfigurator
import org.apache.maven.plugin.logging.Log
import org.apache.maven.plugin.logging.SystemStreamLog
import org.apache.maven.project.MavenProject
import org.eclipse.xtend.lib.annotations.Accessors
import org.slf4j.Logger
import org.slf4j.LoggerFactory

@Accessors
abstract class AbstractMojoStep {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractMojoStep)

	@Inject
	@Named('project')
	protected MavenProject project

	@Inject
	@Named('name')
	protected String name

	@Inject
	@Named('basePackage')
	protected String basePackage

	@Inject
	@Named('activateModel2Code')
	protected boolean activateModel2Code

	@Inject
	@Named('activateCode2Model')
	protected boolean activateCode2Model

	public def init() {
		LOG.debug('Configuring slf4j Logger bridge ...')
		val Log mavenLogger = new MavenLogWrapper(new SystemStreamLog());
		BasicConfigurator.configure(new Maven2Slf4jLoggerBridge(mavenLogger));

		LOG.debug('Plugin configuration:')
		LOG.debug('  project: {}', project.groupId + '.' + project.artifactId)
		LOG.debug('  name: {}', name)
		LOG.debug('  basePackage: {}', basePackage)
		LOG.debug('  activateModel2Code: {}', activateModel2Code)
		LOG.debug('  activateCode2Model: {}', activateCode2Model)
	}
}

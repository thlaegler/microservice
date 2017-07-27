package com.laegler.microservice.maven.plugin;

import org.apache.log4j.AppenderSkeleton;
import org.apache.log4j.Level;
import org.apache.log4j.spi.LoggingEvent;
import org.apache.maven.plugin.logging.Log;

class Maven2Slf4jLoggerBridge extends AppenderSkeleton {

	Log logger

	new(Log logger) {
		this.logger = logger
	}

	override append(LoggingEvent event) {
		val int level = event.getLevel.toInt
		val String msg = event.getFQNOfLoggerClass() + ' | ' + event.message.toString
		if (level == Level.DEBUG_INT || level == Level.TRACE_INT) {
			this.logger.debug(msg);
		} else if (level == Level.INFO_INT) {
			this.logger.info(msg)
		} else if (level == Level.WARN_INT) {
			this.logger.warn(msg)
		} else if (level == Level.ERROR_INT || level == Level.FATAL_INT) {
			this.logger.error(msg);
		}
		this.logger.debug('Location: ' + event.locationInformation.toString)
	}

	override close() {}

	override requiresLayout() {
		false
	}
}

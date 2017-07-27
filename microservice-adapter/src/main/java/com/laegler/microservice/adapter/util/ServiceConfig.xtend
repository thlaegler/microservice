package com.laegler.microservice.adapter.util

import org.eclipse.xtend.lib.annotations.Data

@Data
class ServiceConfig {

	val Boolean enableLog
	val Boolean authRequired
	val String appEnv
	val Integer timeoutInMs
	val String serviceUrl
	val String serviceName
	val String serviceVersion
	val String serviceNamespace
}
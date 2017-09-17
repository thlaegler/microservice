package org.example.utils.requesthandler

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import org.springframework.web.servlet.HandlerMapping
import org.example.utils.requesthandler.RequestParam
import javax.servlet.http.HttpServletRequest

import java.util.Locale
import java.util.Map

@Component
public class RequestMetadata {

	private static final Logger LOG = LoggerFactory.getLogger(RequestMetadata)

	private ThreadLocal<String> threadTenant = new ThreadLocal
	private ThreadLocal<Locale> threadLocale = new ThreadLocal

	@Autowired
	private HttpServletRequest httpRequest

	def Locale getLocale() {
		if (threadLocale !== null && threadLocale.get !== null) {
			return threadLocale.get
		}

		if (httpRequest !== null) {
			// Trying to get locale from HTTP request header
			val String headerValue = getHeaderAttrValue(RequestParam.LOCALE_HTTP_HEADER_ATTR_NAME)
			if (headerValue !== null && !headerValue.isEmpty()) {
				LOG.debug('Getting locale from HTTP request header.')
				setLocale(headerValue)
				return threadLocale.get
			}
		}

		// return Locale.getDefault()
		throw new IllegalStateException('Locale must be set.')
	}

	/**
	 * Get the locale in custom format with under score (e.g. en_US). This method exists just for legacy
	 * reasons and should not be used in the future.
	 */
	def String getCustomLocale() {
		return localeString.replaceAll('-', '_')
	}

	/**
	 * Get the locale as string. This method exists just for legacy reasons and should not be used in
	 * the future.
	 */
	def String getLocaleString() {
		return locale.toLanguageTag
	}

	def String getTenant() {
		if (threadTenant !== null && threadTenant.get !== null) {
			return threadTenant.get
		}

		if (httpRequest !== null) {
			// Trying to get tenant from HTTP request header
			val String headerValue = getHeaderAttrValue(RequestParam.TENANT_HTTP_HEADER_ATTR_NAME)
			if (headerValue !== null && !headerValue.isEmpty) {
				LOG.debug('Getting tenant from HTTP request header.')
				threadTenant.set(headerValue)
				return threadTenant.get
			}
		}

		throw new IllegalStateException('Tenant must be set.')
	}

	def void setLocale(String localeString) {
		// TODO: validate if language is supported by tenant
		threadLocale.set(Locale.forLanguageTag(localeString.replaceAll('_', '-')))
	}

	def void setTenant(String tenant) {
		threadTenant.set(tenant)
	}

	private def String getPathAttrValue(String attrName) {
		try {
			return (httpRequest.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE) as Map).get(
				attrName) as String
		} catch (Throwable e) {
			LOG.warn('No thread-bound request found. This could happen on Spring start-up')
			'default'
		}
	}

	private def String getHeaderAttrValue(String attrName) {
		try {
			return httpRequest.getHeader(attrName)
		} catch (Throwable e) {
			LOG.warn('No thread-bound request found. This could happen on Spring start-up')
			'default'
		}
	}

}

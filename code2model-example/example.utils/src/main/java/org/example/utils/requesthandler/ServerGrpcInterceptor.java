package org.example.utils.requesthandler;

import io.grpc.Metadata;
import io.grpc.ServerCall;
import io.grpc.ServerCall.Listener;
import io.grpc.ServerCallHandler;
import io.grpc.ServerInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ServerGrpcInterceptor implements ServerInterceptor {

	private static final Logger LOG = LoggerFactory.getLogger(ServerGrpcInterceptor.class);

	@Autowired
	private RequestMetadata requestMetadata;

	@Override
	public <ReqT, RespT> Listener<ReqT> interceptCall(ServerCall<ReqT, RespT> call, Metadata headers, ServerCallHandler<ReqT, RespT> next) {

		// Tenant
		final String tenant = headers.get(RequestParam.TENANT_GRPC_METADATA_KEY);
		LOG.debug("Intercepting metadata from gRPC request ({}={})", RequestParam.TENANT_ATTR_NAME, tenant);
		requestMetadata.setTenant(tenant);

		// Locale
		final String localeString = headers.get(RequestParam.LOCALE_GRPC_METADATA_KEY);
		LOG.debug("Intercepting metadata from gRPC request ({}={})", RequestParam.LOCALE_ATTR_NAME, localeString);
		requestMetadata.setLocale(localeString);

		return next.startCall(call, headers);
	}
}

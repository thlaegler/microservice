package org.example.utils.requesthandler;

import io.grpc.CallOptions;
import io.grpc.Channel;
import io.grpc.ClientCall;
import io.grpc.ClientInterceptor;
import io.grpc.ForwardingClientCall.SimpleForwardingClientCall;
import io.grpc.Metadata;
import io.grpc.MethodDescriptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class ClientGrpcInterceptor implements ClientInterceptor {

	private static final Logger LOG = LoggerFactory.getLogger(ClientGrpcInterceptor.class);

	@Autowired
	private RequestMetadata requestMetadata;

	@Override
	public <ReqT, RespT> ClientCall<ReqT, RespT> interceptCall(MethodDescriptor<ReqT, RespT> method, CallOptions callOptions, Channel next) {
		return new SimpleForwardingClientCall<ReqT, RespT>(next.newCall(method, callOptions)) {

			@Override
			public void start(Listener<RespT> responseListener, Metadata headers) {

				// Tenant
				final String tenant = requestMetadata.getTenant();
				LOG.debug("Adding metadata to gRPC request ({}={})", RequestParam.TENANT_GRPC_METADATA_NAME, tenant);
				headers.put(RequestParam.TENANT_GRPC_METADATA_KEY, tenant);

				// Locale
				final Locale locale = requestMetadata.getLocale();
				LOG.debug("Adding metadata to gRPC request ({}={})", RequestParam.LOCALE_GRPC_METADATA_NAME, locale.toLanguageTag());
				headers.put(RequestParam.LOCALE_GRPC_METADATA_KEY, locale.toLanguageTag());

				// headers.merge(headers);
				super.start(responseListener, headers);
			}
		};
	}
}

package org.example.utils.requesthandler

import io.grpc.Metadata
import io.grpc.Metadata.Key

class RequestParam {

  // Locale
  public static final String LOCALE_ATTR_NAME = "locale";
  public static final String LOCALE_GRPC_METADATA_NAME = LOCALE_ATTR_NAME;
  public static final String LOCALE_HTTP_PATH_ATTR_NAME = LOCALE_ATTR_NAME;
  public static final String LOCALE_HTTP_HEADER_ATTR_NAME = "Accept-Language";
  public static final Key<String> LOCALE_GRPC_METADATA_KEY = Metadata.Key.of(LOCALE_GRPC_METADATA_NAME, Metadata.ASCII_STRING_MARSHALLER);

  // Tenant
  public static final String TENANT_ATTR_NAME = "tenant";
  public static final String TENANT_GRPC_METADATA_NAME = TENANT_ATTR_NAME;
  public static final String TENANT_HTTP_PATH_ATTR_NAME = TENANT_ATTR_NAME;
  public static final String TENANT_HTTP_HEADER_ATTR_NAME = "X-XM-Tenant";
  public static final Key<String> TENANT_GRPC_METADATA_KEY = Metadata.Key.of(TENANT_GRPC_METADATA_NAME, Metadata.ASCII_STRING_MARSHALLER);

}
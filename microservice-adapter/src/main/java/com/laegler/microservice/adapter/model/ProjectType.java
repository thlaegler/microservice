package com.laegler.microservice.adapter.model;


public enum ProjectType {

  PARENT("parent", "pom"), //

  COMMON("common", "jar"), //
  MODEL("model", "ejb"), //
  PERSISTENCE("persistence", "ejb"), //
  BUSINESS("business", "ejb"), //
  FACES("faces", "war"), //
  BASE("", "war"), //
  REST("rest", "jar"), //
  REST_SERVER("rest.server", "jar"), //
  REST_CLIENT("rest.client", "jar"), //
  SOAP("soap", "jar"), //
  SOAP_CLIENT("soap.client", "war"), //
  SOAP_SERVER("soap.server", "jar"), //
  GRPC("grpc", "jar"), //
  GRPC_SERVER("grpc.server", "jar"), //
  GRPC_CLIENT("grpc.client", "jar"), //
  EAR("ear", "ear"), //

  // DOCKER("docker", "jar"), //
  // DOCS("docs", "jar"), //
  // PROBLEM("problems", "jar") //
  // ASSETS("assets", "jar"), //
  // ANNOTATION("annotation", "jar"), //

  UNDEFINED("undefined", "jar");

  private String name;
  private String packaging;

  ProjectType(String name, String packaging) {
    this.name = name;
    this.packaging = packaging;
  }

  public String getName() {
    return name;
  }

  public String getPackaging() {
    return packaging;
  }

}

package com.laegler.microservice.adapter.model;

public enum OverwritePolicy {

  KEEP(""), //
  OVERWRITE_IF_OLD_VERSION(""), //
  OVERWRITE("");

  private String description;

  OverwritePolicy(String description) {
    this.description = description;
  }

  public String getDescription() {
    return description;
  }

}

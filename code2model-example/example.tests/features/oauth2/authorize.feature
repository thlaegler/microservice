@Staging
Feature: Authorize with OAuth2 Access Token

  @BatteriesExpert @Paul
  Scenario: As a admin user I want authorize with my access token
    When the user has a access token
    And the user requests customers
    Then the response code should be 200
    And the response should contain customer

  Scenario: Dummy
  	Given is an environment with name staging
    Given is a store with id test1.staging.xmsymphony.com
    Given is a user with name dummy and password p4ssw0rd
    When the user requests gateway/healthz
    Then the response should contain healthy

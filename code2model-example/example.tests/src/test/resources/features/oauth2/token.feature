@Staging
Feature: Get OAuth2 Access Token

  @BatteriesExpert @Paul
  Scenario: As a admin user I want to get a access token by by client ID
    When the user authenticates with client id
    Then the response code should be 200
    And the response should contain access_token
    And the access token should be valid

  @BatteriesExpert @Paul
  Scenario: As a admin user I want to get authenticated by username and password
    When the user authenticates with username and password
    Then the response code should be 200
    And the response should contain access_token
    And the access token should be valid

  @BatteriesExpert @Paul
  Scenario: As a admin I want to get a access token by refresh token
    When the user authenticates with refresh token
    Then the response code should be 200
    And the response should contain access_token
    And the access token should be valid

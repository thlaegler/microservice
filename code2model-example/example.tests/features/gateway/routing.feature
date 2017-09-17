@Staging
Feature: Get Health status of gateway (/healthz)

  Scenario: As a guest user I want to get the status of the gateway
    Given is a guest user
    Given is a user with name lalala and password lsls
    When the user requests GET lala
    Then the response should countain "healthy"
    And the response code should be 200
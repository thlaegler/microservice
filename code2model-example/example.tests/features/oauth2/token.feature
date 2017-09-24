Feature: OAuth2 Access Token RESTful API

  Scenario: As a user I want to obtain a access token by username and password
    Given is a user with username "admin" and password "p4ssw0rd"
    Given is a client ID "example-client"
    When the user requests a token by username and password
    Then the response code should be 200
    Then the response body should contain a valid access token

  Scenario: As a user I want to obtain a access token by refresh token
    Given is a refresh token "1233123"
    When the client requests a token by refresh token
    Then the response code should be 200
    Then the response body should contain a valid access token

  Scenario: As a client I want to obtain a token by client ID and client secret
    Given is a client ID "example-client" and a client secret "example-client"
    When the client requests a token by client ID and client secret
    Then the response code should be 200
    Then the response body should contain a valid access token

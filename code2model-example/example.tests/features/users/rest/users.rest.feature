Feature: Users RESTful API

  Scenario: As user I want to add a new user.
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    Given is a User with username "test" and email "test@test.com"
    When the authorized user adds the user
    Then the response code should be 201
    Then the response body should contain the user

  Scenario: As user I want to update an existing user.
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    Given is a User with id 1 and username "test" and email "test@test.com"
    When the authorized user updates the user
    Then the response code should be 200
    Then the response body should contain the user
    
  Scenario: As user I want to delete a user.
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    Given is a User with id 1
    When the authorized user deletes the user
    Then the response code should be 204
    Then the response body should be empty

  Scenario: As user I want to get an existing user by ID.
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    Given is a User with id 1
    When the authorized user requests the user by ID
    Then the response code should be 200
    Then the response body should contain the user
    
  Scenario: As user I want to get an existing user by username.
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    Given is a User with username "test"
    When the authorized user requests the user by username
    Then the response code should be 200
    Then the response body should contain the user
    
  Scenario: As user I want to get all users
    Given is a authorized user with username "admin" and password "p4ssw0rd"
    When the authorized user requests all users
    Then the response code should be 200
    Then the response body should contain a list of users
Feature: User management
  In order to access the platform
  As a user
  I want to register, login and view my profile

  Scenario: Successful registration (US-017)
    Given the API base is configured
    When I register a new user with email "user@example.com" and password "Secret123"
    Then the response status should be 201
    And the response body should include field "id"

  Scenario: Successful login (US-017)
    Given the API base is configured
    When I login with email "user@example.com" and password "Secret123"
    Then the response status should be 200
    And the response body should include field "token"

  Scenario: Profile retrieval (US-023)
    Given I am authenticated as "user@example.com" with password "Secret123"
    When I request my profile
    Then the response status should be 200
    And the response body field "email" should equal "user@example.com"
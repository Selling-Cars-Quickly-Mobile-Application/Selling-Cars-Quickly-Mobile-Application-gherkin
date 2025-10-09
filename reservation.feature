Feature: Reservation management
  In order to use certified services
  As a user
  I want to create and cancel my reservations

  Scenario: Create reservation (US-018)
    Given I am authenticated as "user@example.com" with password "Secret123"
    When I create a reservation for service "certificacion" on date "2025-10-15"
    Then the response status should be 201
    And the response body should include field "reservaId"

  Scenario: Cancel reservation (US-018)
    Given I have an existing reservation
    When I cancel the reservation
    Then the response status should be 200
    And the response body field "status" should equal "cancelada"
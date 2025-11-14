Feature: Inspection reservation
  In order to schedule an inspection
  As a property owner or system
  I want to reserve an inspection on business days

  Background:
    Given I am on the "Reserve Inspection" screen

  Scenario: Reserve inspection with valid data
    When I enter owner email "owner@example.com"
    And I enter sale price "150000"
    And I select date "2025-11-20"
    And I select time "11:00 AM"
    And I tap "Confirm Reservation"
    Then I should see message "Reservation confirmed"
    And the reservation details should include email "owner@example.com"
    And the selected time should equal "11:00 AM"

  Scenario: Block weekend date selection
    When I open the date picker
    And I choose date "2025-11-23"
    Then I should see validation message "Weekdays only (Monday to Friday)"
    And the date field should remain unchanged

  Scenario: Show available time slots
    When the screen loads
    Then I should see time slots
    And the time slots should include "9:00 AM"
    And the time slots should include "11:00 AM"
    And the time slots should include "1:00 PM"
    And the time slots should include "3:00 PM"
    And the time slots should include "5:00 PM"

  Scenario: Require email and price before confirming
    When I select date "2025-11-20"
    And I select time "3:00 PM"
    And I tap "Confirm Reservation"
    Then I should see validation message "Email is required"
    And I should see validation message "Sale price is required"
    And the reservation should not be submitted

  Scenario: Validate email format
    When I enter owner email "not-an-email"
    And I select date "2025-11-20"
    And I select time "1:00 PM"
    And I tap "Confirm Reservation"
    Then I should see validation message "Enter a valid email"

  Scenario: Validate sale price input
    When I enter sale price "abc"
    And I select date "2025-11-20"
    And I select time "1:00 PM"
    And I tap "Confirm Reservation"
    Then I should see validation message "Enter a valid PEN amount"

  Scenario: Handle missing user data plugin error
    Given the user data provider is unavailable
    When the screen attempts to fetch user data
    Then I should see an error containing "MissingPluginException"
    And the error should include channel "reservation_channel"

  Scenario: Change selected time slot
    When I select time "9:00 AM"
    And I select time "3:00 PM"
    Then the selected time should equal "3:00 PM"
    And the previously selected time "9:00 AM" should be unselected
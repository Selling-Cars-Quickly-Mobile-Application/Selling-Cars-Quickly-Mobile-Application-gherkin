Feature: Car Advertisements
In order to browse available cars
As a user
I want to view the car list and open details

Background:
Given I am logged in

Scenario: View car list from Dashboard
When I open "Car Ads" from the Dashboard
Then I should see a list of cars
And each item shows title and brand-model

Scenario: Open car details
Given the car list is visible
When I select a car from the list
Then I should see the car detail screen
And I can tap "View Details" to open details

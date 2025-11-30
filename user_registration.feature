Feature: User Registration
In order to create an account
As a new user
I want to register with my personal information and chosen plan

Scenario: Complete registration with Free plan (US-004)
Given I am on the Register screen
And I enter full name "John Doe"
And I enter email "john.doe@gmail.com"
And I enter password "Password123"
And I select plan "Free"
When I complete the registration steps
And I submit the registration
Then I should be redirected to the Dashboard
And I should see "Welcome back!" message

Scenario: Validation errors when fields are invalid
Given I am on the Register screen
When I try to proceed with empty fields
Then I should see an error indicating invalid or missing data

Scenario: Payment information required for paid plan
Given I am on the Register screen
And I select plan "Monthly"
When I attempt to finish without payment data
Then I should see an error requiring payment information

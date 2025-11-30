Feature: User Login
In order to access the application as a user
As a registered user
I want to sign in to my account

Scenario: Successful login
Given I am on the Login screen
And I enter email "user@gmail.com"
And I enter password "Password123"
When I tap "Login"
Then I should be redirected to the Dashboard
And I should see "Welcome back!" message

Scenario: Invalid credentials
Given I am on the Login screen
And I enter email "user@gmail.com"
And I enter password "WrongPassword"
When I tap "Login"
Then I should see error "Incorrect credentials. Check email and password."

Scenario: Navigate to Register
Given I am on the Login screen
When I tap "Register"
Then I should see the Register screen

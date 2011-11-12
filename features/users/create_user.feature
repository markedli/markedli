Feature: Create a user
  In order to create and orginize bookmarks
  As a guest
  I want to create a user account

  Scenario: Guest creates account
    Given I am a guest
    When I create a user account
    Then I should be notified of my new account

  Scenario: Guest tries to create an account with a taken email
    Given A user account exists
      And I am logged out
    When I create a user account with a taken email
    Then I should be notified of an error

  Scenario: Guest tries to create an account with a taken username
    Given A user account exists
      And I am logged out
    When I create a user account with a taken username
    Then I should be notified of an error

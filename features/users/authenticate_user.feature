Feature: Authenticate a user
  In order to create an orginize bookmarks
  As a user
  I want to be able to sign in to my account

  Scenario: User signs in using email
    Given I have a user account
      And I am logged out
    When I sign in using my email
    Then I am signed in

  Scenario: User signs in using username
    Given I have a user account
      And I am logged out
    When I sign in using my username
    Then I am signed in

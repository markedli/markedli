Feature: Create a bookmark
  In order to create and organize bookmarks
  As a user
  I want to create a bookmark

  Scenario: User creates bookmark
		Given I am a guest
    Given I am logged in
    When I create a bookmark
    Then I should see my new bookmark


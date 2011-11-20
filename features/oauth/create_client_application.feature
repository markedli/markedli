Feature: User creates client application
  In order to integrate my bookmarks to other applicatons
  As a user
  I want to create client applications for markedly to interact with

  Scenario: User creates a client application
    Given I am logged in
    When I create a client application
    Then I have a key and secret for the application

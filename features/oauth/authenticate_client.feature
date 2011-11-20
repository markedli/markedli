Feature: Client application authentication
  In order to integrate data from markedli into other applications
  As a user
  I want designated client applications to authenticate

  Scenario: Oauth Authentication
    Given I am logged in
    And I have created a client application
    When My client application authenticates
    Then My client has an access token

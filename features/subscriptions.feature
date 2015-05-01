@omniauth_test
Feature: Subscriptions
  
  As a user
  I want to be able to subscribe and unsubscribe from users
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage
    
  Scenario: a signed in user can subscribe to another user
    Then I should see "All Users"
    And I follow "All Users"
    And I follow "Hello1 World1"
    Then I should see "0 subscribers"
    And I press "Subscribe"
    Then I should see "1 subscribers"

  Scenario: a subscribed user can unsubscribe from another user
    Then I should see "All Users"
    And I follow "All Users"
    And I follow "Hello1 World1"
    Then I should see "0 subscribers"
    And I press "Subscribe"
    Then I should see "1 subscribers"
    Then I press "Unsubscribe"
    Then I should see "0 subscribers"

  Scenario: a user should be able to see subscribers of another user
    Then I should see "All Users"
    And I follow "All Users"
    And I follow "Hello1 World1"
    Then I follow "0 subscribing"
    Then I should see "Users that Hello1 is subscribing to"
    And I should see "Hello1 World1"
  
  Scenario: a user should be able to see what another user is subscribed to
    Then I should see "All Users"
    And I follow "All Users"
    And I follow "Hello1 World1"
    Then I follow "0 subscribers"
    Then I should see "Hello1's subscribers"
    And I should see "Hello1 World1"
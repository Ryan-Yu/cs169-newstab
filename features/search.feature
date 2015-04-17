@omniauth_test
Feature: Search
  
  As a user
  So that users can be search by newstab users
  I want to be able to use the search to search for users by name and email
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage

Scenario: a signed in user search for user by first name
  Then I fill in "search_field" with "Hello1"
  Then I press "Search"
  Then I should see "Hello1 World1"
  
Scenario: a signed in user search for user by last name
  Then I fill in "search_field" with "World1"
  Then I press "Search"
  Then I should see "Hello1 World1"
  
Scenario: a signed in user search for user by email
  Then I fill in "search_field" with "helloworld1@gmail.com"
  Then I press "Search"
  Then I should see "Hello1 World1"
  
  
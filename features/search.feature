@omniauth_test
Feature: Search
  
  As a user
  So that users can be search by newstab users
  I want to be able to use the search to search for users by name and email
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage

Scenario: a signed in user can post an article
  # Then I should see "Search by name/email"
  Then I should see "search_field" filled in with "Search by name/email"

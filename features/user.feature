@omniauth_test
Feature: Users
  
  As a user
  So that I can better navigate the website
  I want to be able to modify my profile
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage
    
  Scenario:
    Given I press "Hello"
    And I follow "My Profile"
    And I press "Set Interested Categories"
    Then I should see "No categories selected."
    And I should see "(0)"
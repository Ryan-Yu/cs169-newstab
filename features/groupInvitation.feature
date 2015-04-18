@omniauth_test
Feature: GroupCreation
 
  As a user
  So that I can interact with specific people
  I want to be able to send and receive invitations to groups

  Background:
    Given the following users exist:
      | username |
      | Ben      |
      | Will     |
      | Ryan     |
    And "3" subscribes to "1"
    And the user "1" created the following groups:
      | groupname   | privacy_level |
      | Public      | public        |
      | Private     | private       |
    And I am signed in as "Ben"
    And I am on the homepage
  
  Scenario: I cannot invite users that don't exist to my groups
    Given I visit the group page for "Public"
    When I fill in "username" with "asdf@gmail.com"
    And I press "Invite"
    Then I should see "Could not find user"
    And I should be on the group page for "Public"
  
  # Scenario: I can invite subscribers to my groups
  #   Given I visit the group page for "Public"
  #   When I fill in "username" with "Ryan@gmail.com"
  #   And I press "Invite"
  #   Then I should see "Invitation has been sent"
  #   And I should be on the group page for "Public"
    # Examples:
    #   | groupname | 
    #   |  Private  | 
    #   | Subscribers |
    #   | Public    |
 
  # Scenario: I can not invite non-subscribers to my groups
  #   Given I visit the group page for "Subscribers"
  #   When I fill in "username" with "Will@gmail.com"
  #   And I press "Invite"
  #   Then I should see "You can only invite subscribers"
  #   And I should be on the group page for "Subscribers"
    # Examples:
    #   | groupname | 
    #   |  Private  | 
    #   | Subscribers |
    #   | Public    |
    
  # Scenario Outline: I can view invitations to groups
  #   Given I visit the group page for <groupname>
  #   When I fill in "username" with "Ryan@gmail.com"
  #   And I press "Invite"
  #   Then I should see "Invitation has been sent"
  #   And I should be on the group page for <groupname>
  #   Examples:
  #     | groupname | 
  #     |  Private  | 
  #     | Subscribers |
  #     | Public    |@omniauth_test

  
  # Scenario: I can invite subscribers to my groups
  #   Given I visit the group page for "Public"
  #   When I fill in "username" with "Ryan@gmail.com"
  #   And I press "Invite"
  #   Then I should see "Invitation has been sent"
  #   And I should be on the group page for "Public"
    # Examples:
    #   | groupname | 
    #   |  Private  | 
    #   | Subscribers |
    #   | Public    |
 
  # Scenario: I can not invite non-subscribers to my groups
  #   Given I visit the group page for "Subscribers"
  #   When I fill in "username" with "Will@gmail.com"
  #   And I press "Invite"
  #   Then I should see "You can only invite subscribers"
  #   And I should be on the group page for "Subscribers"
    # Examples:
    #   | groupname | 
    #   |  Private  | 
    #   | Subscribers |
    #   | Public    |
    
  # Scenario Outline: I can view invitations to groups
  #   Given I visit the group page for <groupname>
  #   When I fill in "username" with "Ryan@gmail.com"
  #   And I press "Invite"
  #   Then I should see "Invitation has been sent"
  #   And I should be on the group page for <groupname>
  #   Examples:
  #     | groupname | 
  #     |  Private  | 
  #     | Subscribers |
  #     | Public    |
Feature: GroupCreations
 
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
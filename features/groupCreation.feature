@omniauth_test

Feature: GroupCreation
 
  As a user
  So that I can interact with specific people
  I want to be able to create groups

  Background:
    Given the following users exist:
      | username |
      | Ben      |
      | Nick     |
      | Will     |
    And "3" subscribes to "1"
    Given I am signed in as "Ben"
    And I am on the homepage
    Given I follow "Groups"
    And I fill in "New group name" with "Phish"
    
  
  Scenario: I can create a group
    And I press "Create Group"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "Phish" in the list "my-groups"
    
  Scenario: I can make the group private
    And I check "group_private"
    And I press "Create Group"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "Phish" in the list "my-groups"
    And I press "Ben"
    But I follow "Sign out"
    But I am signed in as "Nick"
    When I follow "Groups"
    Then I should not see "Phish" in any list
    And I press "Nick"
    But I follow "Sign out"
    And I am signed in as "Will"
    When I follow "Groups"
    Then I should not see "Phish" in any list
    
  Scenario: Groups I create will by default be public
    And I press "Create Group"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "Phish" in the list "my-groups"
    And I press "Ben"
    But I follow "Sign out"
    But I am signed in as "Will"
    When I follow "Groups"
    And I follow "Explore Public Groups"
    Then I should see "Phish"
    # And I should see "New Group" in the list "my-subscribers-groups"
    # But I follow "Sign out"
    # But I am signed in as "Nick"
    # When I follow "Groups"
    # Then I should see "New Group" in the list "public-groups"
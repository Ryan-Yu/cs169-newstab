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
    Then I follow "Create Group"
    And I fill in "Group name" with "New Group"
    
  
  Scenario: I can create a group
    And I press "Create"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "New Group" in the list "my-groups"
    
  Scenario: I can make the group private
    And I check "group_private"
    And I press "Create"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "New Group" in the list "my-groups"
    But I follow "Sign out"
    But I am signed in as "Nick"
    When I follow "Groups"
    Then I should not see "New Group" in any list
    But I follow "Sign out"
    And I am signed in as "Will"
    When I follow "Groups"
    Then I should not see "New Group" in any list
    
    
  Scenario: I can make the group visible to subscribers only
    And I check "group_subscribers_only"
    And I press "Create"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    Then I should see "New Group" in the list "my-groups"
    But I follow "Sign out"
    And I am signed in as "Will"
    When I follow "Groups"
    # Then I should see "New Group" in the list "my-subscribers-groups"
    # But I follow "Sign out"
    # But I am signed in as "Nick"
    # When I follow "Groups"
    # Then I should not see "New Group" in any list
    
  Scenario: Groups I create will by default be public
    And I press "Create"
    Then I should be on the group page for group with index "1"
    And I follow "Groups"
    And I should see "New Group" in the list "my-groups"
    But I follow "Sign out"
    But I am signed in as "Will"
    When I follow "Groups"
    Then I should see "New Group" in the list "public-groups"
    # And I should see "New Group" in the list "my-subscribers-groups"
    # But I follow "Sign out"
    # But I am signed in as "Nick"
    # When I follow "Groups"
    # Then I should see "New Group" in the list "public-groups"
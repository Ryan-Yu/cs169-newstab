Feature: Notifications
  
  As a user
  So that I know when to visit NewsTab
  I want to be receive email notifications
  
  
  Background:
    Given the following users exist:
      | username |
      | Ben      |
      | Nick     |
      | Will     |
    And "3" subscribes to "1"
    And the following articles exist:
      | user_id  | url                                    | initial_comment                             |
      | 1        | cool_news_article.com                  | The description for the next big startup.   |
    Given I am signed in as "Ben"
    And I am on the homepage
    # Given I follow "Groups"
    # And I fill in "New group name" with "Phish"
  
  # Scenario: Invited to an article without an account
  #   Given There is no user with email "ben@gmail.com"
  #   And An article is sent to "ben@gmail.com"
  #   Then An email inviting "ben@gmail.com" to use NewsTab should be sent
    
  # Scenario: Invited to an article with an account
  #   Given There is a user with email "ben@gmail.com"
  #   And An article is sent to "ben@gmail.com"
  #   Then An email notifying "ben@gmail.com" of the article should be sent
    
  # Scenario: Invited to a group without an account
  #   Given There is no user with email "ben@gmail.com"
  #   And A group invitation is sent to "ben@gmail.com"
  #   Then An email inviting "ben@gmail.com" to use NewsTab should be sent
    
  # Scenario: Invited to a group with an account
  #   Given There is a user with email "ben@gmail.com"
  #   And A group invitation is sent to "ben@gmail.com"
  #   Then An email notifying "ben@gmail.com" of addition to the group should be sent
    
  # Scenario: Comment notifications enabled
  #   Given I follow "Sign out"
  #   Then I am signed in as "Will"
  #   Then I am on the show page for article "cool_news_article.com"
  #   Then I fill in "comment_box" with "cool story bro"
  #   Then I press "Post Comment"
  #   Then I follow "Sign out"
  #   Then I am signed in as "Ben"
  #   Then I follow "notifications-dropdown"
  #   Then I should see "1 Will World1 has commented on your article"

    
  # Scenario: Comment notifications disabled
  #   Given The user wants comment notifications for an article "Article Title"
  #   When Another user comments on the article "Article Title"
  #   Then The user should not receive an email
    
  Scenario: Group notifications enabled
    And I am on the groups page
    And I fill in "group_group_name" with "Phish"
    And I press "Create Group"
    Then I should see "Group: Phish"
    
    Given I follow "Sign out"
    Then I am signed in as "Will"
    Then I am on the public groups page
    # Then I should see "Subscribe to this group"
    Then I press "Subscribe to this group" 
    Then I follow "Post article to group"
    Then I fill in "Article URL" with "What a story!!!"
    Then I fill in "What do you want to say about this article?" with "Whatever"
    Then I press "Create Article"
    And I should see "Article created!"
    Then I am on the groups page
    # Then I should see "shit"
    Then I follow "Sign out"
    Then I am signed in as "Ben"
    Then I am on the groups page
    Then I follow "notifications-dropdown"
    # Then I should see "1 Will World1 has commented on your article"
    # Given I visit the group page for "Public"
    # When I fill in "username" with "asdf@gmail.com"
    # And I press "Invite"
    # Then I should see "Could not find user"
    # And I should be on the group page for "Public"
    # Given The user wants group notifications for an group "Group Name"
    # When Another user posts an article to the group "Group Name"
    # Then The user should receive an email that an article was posted to the group "Group Name"
  
  # Scenario: Group notifications enabled
  #   Given The user wants group notifications for an group "Group Name"
  #   When Another user posts an article to the group "Group Name"
  #   Then The user should not receive an email
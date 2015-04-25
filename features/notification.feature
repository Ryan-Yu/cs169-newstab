Feature: Notifications
  
  As a user
  So that I know when to visit NewsTab
  I want to be receive email notifications
  
  Scenario: Invited to an article without an account
    Given There is no user with email "ben@gmail.com"
    And An article is sent to "ben@gmail.com"
    Then An email inviting "ben@gmail.com" to use NewsTab should be sent
    
  Scenario: Invited to an article with an account
    Given There is a user with email "ben@gmail.com"
    And An article is sent to "ben@gmail.com"
    Then An email notifying "ben@gmail.com" of the article should be sent
    
  Scenario: Invited to a group without an account
    Given There is no user with email "ben@gmail.com"
    And A group invitation is sent to "ben@gmail.com"
    Then An email inviting "ben@gmail.com" to use NewsTab should be sent
    
  Scenario: Invited to a group with an account
    Given There is a user with email "ben@gmail.com"
    And A group invitation is sent to "ben@gmail.com"
    Then An email notifying "ben@gmail.com" of addition to the group should be sent
    
  Scenario: Comment notifications enabled
    Given The user wants comment notifications for an article "Article Title"
    When Another user comments on the article "Article Title"
    Then The user should receive an email notifying of the new comment on "Article Title"
    
  Scenario: Comment notifications disabled
    Given The user wants comment notifications for an article "Article Title"
    When Another user comments on the article "Article Title"
    Then The user should not receive an email
    
  Scenario: Group notifications enabled
    Given The user wants group notifications for an group "Group Name"
    When Another user posts an article to the group "Group Name"
    Then The user should receive an email that an article was posted to the group "Group Name"
  
  Scenario: Group notifications enabled
    Given The user wants group notifications for an group "Group Name"
    When Another user posts an article to the group "Group Name"
    Then The user should not receive an email
@omniauth_test
Feature: Comments
 
  As a user
  So that I can give my opinion on articles
  I want to be able to post comments

  Background:
    And I am signed in
    # This article will have an id of 1
    And the following articles exist:
      | user_id  | url      | title       | content      | initial_comment       |
      | 1        | fake_url | Fake Title  | Fake content | Fake initial comment. |
    And I am on the homepage
  
Scenario: an unauthenticated user can see comments and who posted them
  Given the following comments exist:
    | user_id  | article_id  | body                             |
    | 1        | 1           | Some cool comment I want to add  |
  And I press "Hello"
  And I follow "Sign out"
  And I am on the show page for article "fake_url"
  Then I should see "Some cool comment I want to add"
  # Need to add functionality to this to get this to work.
  # When I click element "user_comment_1"
  # Then I should be on the profile page for "fbuser"

@javascript
Scenario: a unauthenticated user cannot post a comment
  And I press "Hello"
  And I follow "Sign out"
  And I am on the show page for article "fake_url"
  
  #And I click element "submit_comment_form"
  And I click element "comment_box"
  And I fill in "comment_box" with "lololol"
  And I press "Post"
  Then I should see "You need to sign in or sign up before continuing."
  
@javascript
Scenario: an authenticated user can post a comment
  And I am on the show page for article "fake_url"
  And I click element "comment_box"
  And I press "Post"
  Then I should see "Comment cannot be blank."
  And I am on the show page for article "fake_url"
  And I fill in "comment[body]" with "Some cool comment I want to add"
  And I press "Post"
  Then I should be on the show page for article "fake_url"
  And I should see "Some cool comment I want to add"

@javascript
Scenario: a user can remove comments they suggested
  Given the following comments exist:
    | user_id  | article_id  | body                             |
    | 1        | 1           | Some cool comment I want to add  |
  And I am on the show page for article by id "1"
  Then I should see "Some cool comment I want to add"
  And I follow "Delete"
  And I am on the show page for article by id "1"
  Then I should not see "Some cool comment I want to add"

@javascript
Scenario: a user cannot delete comments suggested by others
  Given the following comments exist:
    | user_id  | article_id  | body                             |
    | 1        | 1           | Some cool comment I want to add  |
  And I press "Hello"
  And I follow "Sign out"
  And another user is signed in
  And I am on the show page for article by id "1"
  Then I should see "Some cool comment I want to add"
  Then I should not see "Delete"
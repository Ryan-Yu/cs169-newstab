@omniauth
Feature: Likes
 
  As a user
  So that I can help distinguish good articles
  I want to be able to like articles

  Background:
    Given I am signed in
    And the following articles exist:
      | user_id  | url      | title       | content      | initial_comment       |
      | 1        | fake_url | Fake Title  | Fake content | Fake initial comment. |
    And I am on the homepage

@javascript
Scenario: an unauthenticated user cannot like an article
  Given I press "Hello"
  And I follow "Sign out"
  And I am on the show page for article "fake_url"
  And I follow "Like this article!"
  Then I should see "You need to sign in or sign up before continuing."
  
@javascript
Scenario: an authenticated user can like an article
  # Given I am signed in with provider "facebook"
  And I am on the show page for article "fake_url"
  And I follow "Like this article!"
  And I should be on the show page for article "fake_url"
  Then I should see "1"
  Then I should see "Unlike this article!"
  And I should not see "Like this article!"

@javascript
Scenario: a user cannot unlike articles they did not like
  Given I press "Hello"
  Given I follow "Sign out"
  And the following likes exist:
    | user_id  | article_id  |
    | 1        | 1           |
  And another user is signed in
  And I am on the show page for article by id "1"
  Then I should see "1"
  And I should see "Like this article!"
  But I should not see "Unlike this article!"

@javascript
Scenario: a user can unlike articles they liked
  And I am on the show page for article "fake_url"
  And I follow "Like this article!"
  And I should be on the show page for article "fake_url"
  Then I should see "1"
  Then I should see "Unlike this article!"
  And I should not see "Like this article!"
  And I follow "Unlike this article!"
  Then I should see "0"
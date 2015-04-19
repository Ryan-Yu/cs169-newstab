@omniauth_test
Feature: Articles
  
  As a user
  So that Articles can be shared with newstab users
  I want to be able to create, share and view articles
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage

@javascript 
Scenario: a signed in user can post an article
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I fill in "Initial comment" with "My first comment"
  And I press "Create Article"
  Then I should see "Article created!"
  Then article url "Hello_World_Article_URL.com" should exist
  
Scenario: a signed in user can not post an invalid article
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I press "Create Article"
  Then I should see "Invalid article."
  And I should see "New article"

Scenario: a user should be able to log out
  Then I am on the homepage
  And I follow "Sign out"
  Then I should not see "Sign out"
  Then I should see "Sign up"

# Scenario: a user should be able to sign in through Facebook
#   Given I am on the '/home' page
#   And I follow "sign up"
#   Then I should see at the '/sign_up' page
#   And if I click the link to sign in with provider "facebook"
#   Then I should be redirected to "facebook" and if I accept terms
#   Then I should be redirected to the '/home' page
#   And I should see ...
   
Scenario: a user cannot edit another user's articles
  Given the following articles exist:
    | user_id  | url                                        | initial_comment                             |
    | 1        | cool_news_article.com                      | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Edit Article"
  Then I should see "You do not have permission to edit this article."

Scenario: a user cannot delete another user's article
  Given the following articles exist:
    | user_id  | url                                        | initial_comment                             |
    | 1        | cool_news_article.com                      | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Destroy Article"
  Then I should see "You do not have permission to delete this article."

Scenario: a user can destroy their own article
  Given the following articles exist:
    | user_id  | url                                    | initial_comment                             |
    | 2        | cool_news_article.com                  | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Destroy Article"
  Then I should not see "cool_news_article.com"
  And I should not see "The description for the next big startup."
  
Scenario: a user can edit his article
  And the following articles exist:
    | user_id  | url                                    | initial_comment                             |
    | 2        | cool_news_article.com                  | The description for the next big startup.   |
  Then I am on the show page for article "cool_news_article.com"
  And I follow "Edit Article"
  And I fill in "Initial comment" with "I changed my comment."
  And I press "Update Article"
  Then I should see "Article successfully updated."

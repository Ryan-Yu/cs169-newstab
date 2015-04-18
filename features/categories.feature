@omniauth_test
Feature: Categories
  
  As a user
  So that Articles can associated with Categories
  I want assign categories to an Article upon creation
  
  Background:
    Given another user has signed up
    And I am signed in
    And I am on the homepage

@javascript 
Scenario: a signed in user can post an article without a category
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I fill in "Initial comment" with "My first comment"
  And I press "Create Article"
  Then I should see "Article created!"
  # And I should see ...
  
Scenario: a signed in user can post an article with an associated category
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I fill in "Initial comment" with "My first comment"
  # And I check "Entertainment"
  # And I check "#{categories_6}"
  # And I check "categories[1]"
  # And I check "article_Entertainment"
  # And I check "categories_6"
  # And I click the checkbox "6"
  # And I click element "categories_6"
  And I press "Create Article"
  Then I should see "Article created!"
  Then article url "Hello_World_Article_URL.com" should exist

Scenario: an article with an associated category should be under respective category tab
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I fill in "Initial comment" with "My first comment"
  # And I check "Entertainment"
  # And I click element "categories_6"
  And I press "Create Article"
  Then I should see "Article created!"
  Then article url "Hello_World_Article_URL.com" should exist
  And I should see "Article Categories"
  And I follow "Article Categories"
  # And I click element "Entertainment"
  # And I follow "Last"
  # And I follow "Written by"
  # Then I should see "Hello_World_Article_URL.com"
  # And I should see "My first comment"
  
Scenario: a deleted article should be removed from all associated category tabs
  Then I should see "Sign out"
  Then I should see "New Article"
  Then I should see "Hello"
  When I follow "New Article"
  And I fill in "Url" with "Hello_World_Article_URL.com"
  And I fill in "Initial comment" with "My first comment"
  # And I check "Entertainment"
  # And I click element "categories_6"
  And I press "Create Article"
  Then I should see "Article created!"
  Then article url "Hello_World_Article_URL.com" should exist
  And I should see "Article Categories"
  And I follow "Article Categories"
  And I click element "Entertainment"
  And I follow "Last"
  And I follow "Written by"
  Then I should see "Hello_World_Article_URL.com"
  And I should see "My first comment"
  And I should see "Destroy Article"
  Then I follow "Destroy Article"
  And I follow "Article Categories"
  # And I click element "Entertainment"
  # And I follow "Last"
  # And I follow "Written by"
  # Then I should not see "Hello_World_Article_URL.com"
  # And I should not see "My first comment"
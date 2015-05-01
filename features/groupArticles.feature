
Feature: GroupArticles
  
  Background:
    Given the following users exist:
      | username |
      | Ben      |
    And the user "1" created the following groups:
      | groupname   | privacy_level |
      | BenGroup    | public        |
    And I am signed in as "Ben"
    And I visit the group page for "BenGroup"
  
  Scenario: I can add articles to a group I created
    Given group "BenGroup" has "0" article
    And I follow "Post article to group"
    Given I fill in "Article URL" with "mlb.com"
    And I fill in "What do you want to say about this article?" with "Sport"
    And I press "Create Article"
    Then group "BenGroup" has "1" article
  
  Scenario: I can see group articles
    Given I follow "Post article to group"
    And I fill in "Article URL" with "mlb.com"
    And I fill in "What do you want to say about this article?" with "Sport"
    And I press "Create Article"
    And I visit the group page for "BenGroup"
    
  Scenario: I can search for public groups
    Given I am on the homepage
    When I follow "Groups"
    And I follow "Explore Public Groups"
    And I fill in "group_search_field" with "BenGroup"
    And I press "Search for Groups"
    Then I should see "Search Results"

    




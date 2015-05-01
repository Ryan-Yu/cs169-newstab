
Feature: GroupArticles
  
  Background:
    Given the following users exist:
      | username |
      | Ben      |
    And I am signed in as "Ben"
    And I am on the groups page
    And I fill in "group_group_name" with "Phish"
    And I press "Create Group"
    Then I should see "Group: Phish"
    And I visit the group page for "Phish"
  
  Scenario: I can add articles to a group I created
    Given group "Phish" has "0" article
    And I follow "Post article to group"
    Given I fill in "Article URL" with "mlb.com"
    And I fill in "What do you want to say about this article?" with "Sport"
    And I press "Create Article"
    Then group "Phish" has "1" article
  
  Scenario: I can see group articles
    Given I follow "Post article to group"
    And I fill in "Article URL" with "mlb.com"
    And I fill in "What do you want to say about this article?" with "Sport"
    And I press "Create Article"
    And I visit the group page for "Phish"
    
  Scenario: I can search for public groups
    Given I am on the homepage
    When I follow "Groups"
    And I follow "Explore Public Groups"
    And I fill in "group_search_field" with "Phish"
    And I press "Search for Groups"
    Then I should see "Search Results"

    




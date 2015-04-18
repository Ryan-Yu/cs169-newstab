
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
    Given I fill in "Url" with "mlb.com"
    And I fill in "Initial comment" with "Sport"
    And I press "Create Article"
    Then group "BenGroup" has "1" article
  
  Scenario: I can see group articles
    Given I fill in "Url" with "mlb.com"
    And I fill in "Initial comment" with "Sport"
    And I press "Create Article"
    And I visit the group page for "BenGroup"
    Then I should see "Written by"




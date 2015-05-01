# @omniauth_test
# Feature: Analytics
  
#   As an admin
#   So that I can better serve my users
#   I want to gather analytics on the typical behaviors of my users
  
#   Background:
#     Given another user has signed up
#     And I am signed in as an Admin
#     And I am on the Admin Portal
    
#   @javascript 
#   Scenario: an admin user should be able to see date of birth of users
#     Then I should see "Users"
#     When I follow "Users"
#     Then I should see "Date of Birth"

#   @javascript
#   Scenario: an admin user should be able to see user login statistics
#     Then I should see "Users"
#     When I follow "Users"
#     And I follow "Hello1 World1"
#     Then I should see "Sign in count"
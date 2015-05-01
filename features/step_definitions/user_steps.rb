Given /^I am signed in with provider facebook$/ do
  # Newly added
 
  visit "/auth/facebook"

end

Then /^user "(.*?)" should not exist$/ do |user_email|
  !User.find_by_email(user_email)
end

Then /^user "(.*?)" should  exist$/ do |user_email|
  !!User.find_by_email(user_email)
end

When /^I am signed in$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign up"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "helloworld@gmail.com"}
  step %Q{I fill in "First name" with "Hello"}
  step %Q{I fill in "Last name" with "World"}
  step %Q{I fill in "Password (8 characters minimum)" with "helloworld"}
  step %Q{I fill in "Password confirmation" with "helloworld"}
  step %Q{I press "Register"}
end

When /^another user is signed in$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign up"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "helloworld1@gmail.com"}
  step %Q{I fill in "First name" with "Hello1"}
  step %Q{I fill in "Last name" with "World1"}
  step %Q{I fill in "Password (8 characters minimum)" with "helloworld1"}
  step %Q{I fill in "Password confirmation" with "helloworld1"}
  step %Q{I press "Register"}
end

When /^another user has signed up$/ do
  step %Q{another user is signed in}
  step %Q{I press "Hello1"}
  step %Q{I follow "Sign out"}
end

Given /^the following users exist:$/  do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
      step %Q{I am on the homepage}
      step %Q{I follow "Sign up"}
      step %Q{I wait a bit}
      step %Q{I wait a bit}
      step %Q{I wait a bit}
      step %Q{I fill in "Email" with "#{row[:username]}@gmail.com"}
      step %Q{I fill in "First name" with "#{row[:username]}"}
      step %Q{I fill in "Last name" with "World1"}
      step %Q{I fill in "Password" with "helloworld1"}
      step %Q{I fill in "Password confirmation" with "helloworld1"}
      step %Q{I press "Sign up"}
      step %Q{I follow "Sign out"}
  end
end

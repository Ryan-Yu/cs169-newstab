

Given(/^"(.*?)" subscribes to "(.*?)"$/) do |arg1, arg2|
  
  Subscription.create!(:subscribed_id => arg2, :subscriber_id => arg1)

end

Given(/^I am signed in as "(.*?)"$/) do |arg1|
  step %Q{I follow "Sign in"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "#{arg1}@gmail.com"}
  step %Q{I fill in "Password" with "helloworld1"}
  step %Q{I press "Log in"}
end


Then(/^I should see "(.*?)" in the list "(.*?)"$/) do |arg1, arg2|
  
  find_by_id(arg2).should have_content(arg1)

end

Then(/^I visit the all groups page$/) do
  visit '/groups'
end

Then(/^I visit the group page for "(.*)"$/) do |group_name|
  visit '/groups/' + Group.find_by_group_name(group_name).id.to_s
end

Then(/^I should not see "(.*?)" in any list$/) do |arg1|
  page.body.should_not have_content(arg1)
end

Then(/^the user "1" created the following groups:$/) do |table|
  table.hashes.each do |row|
    if row[:privacy_level] == "public"
      User.find(1).groups.create :group_name => row[:groupname], :private => false
    elsif row[:privacy_level] == "private"
      User.find(1).groups.create :group_name => row[:groupname], :private => true
    else
      User.find(1).groups.create :group_name => row[:groupname], :subscribers_only => true
    end
  end
end

Given(/^group "(.*?)" has "(.*?)" article$/) do |arg1, arg2|
  Group.find_by_group_name(arg1).articles.count.should == arg2.to_i
end


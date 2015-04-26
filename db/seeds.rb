require 'faker'

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

Category.create!('name' => 'United States')
Category.create!('name' => 'World')
Category.create!('name' => 'Politics')
Category.create!('name' => 'Tech')
Category.create!('name' => 'Health')
Category.create!('name' => 'Entertainment')
Category.create!('name' => 'Travel')
Category.create!('name' => 'Sports')

# Users
User.create!(first_name:"Example",
             last_name: "User",
             email: "exampleuser@gmail.com",
             password: "password",
             password_confirmation: "password")



99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(first_name: name.split(' ')[0],
              last_name: name.split(' ')[1],
              email: email,
              password: password,
              password_confirmation: password)
end

# Articles
users = User.order(:created_at).take(6)
50.times do
  fake_url = Faker::Lorem.sentence(1)
  fake_comment = Faker::Lorem.sentence(2)
  fake_content = Faker::Lorem.sentence(4)
  fake_title = Faker::Lorem.sentence(6)
  users.each { |user| user.articles.create!(url: fake_url, initial_comment: fake_comment,
    content: fake_content, categories: Category.all, title: fake_title ) }
end

# Following relationships
users = User.all
user  = users.first
subscribing = users[2..50]
subscribers = users[3..40]
subscribing.each { |subscribed| user.subscribe(subscribed) }
subscribers.each { |subscriber| subscriber.subscribe(user) }
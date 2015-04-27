source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise'
gem 'pismo'
gem 'omniauth'
gem 'omniauth-facebook'
# gem 'selenium-webdriver'
gem 'faker'
gem 'fakeweb'
gem 'rake'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'kaminari'
gem 'bootstrap-kaminari-views'

gem 'activeadmin', github: 'activeadmin'

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'simplecov'
  gem 'foreman'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'byebug'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end

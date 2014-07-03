source 'https://rubygems.org'

# ruby and rails
ruby '2.1.2'
gem 'rails', '4.1.1'

# postgres db
gem 'pg', '0.17.1'

# devise
gem 'devise', '3.2.3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'kaminari', '0.15.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '3.1.0'
gem 'turbolinks', '2.2.1'
gem 'jbuilder', '~> 1.2'
gem 'slim-rails', '2.1.5'

gem 'therubyracer', '0.12.1'
gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails', '2.2.8'

gem 'public_activity', '1.4.1'
gem 'validates_email_format_of', '1.5.3'
gem 'html5_validators', '1.1.2'

group :staging, :production do
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn', '4.8.3'
end

group :development do
  gem 'thin', '1.6.2'
  gem 'better_errors', '1.1.0'
  gem 'binding_of_caller', '0.7.2'
end

group :test do
  gem 'capybara', '2.2.1'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', '1.2.0'
  gem 'rspec-rails', '2.14.1'
  gem 'rspec-core', '2.14.8'
  gem 'rspec-expectations', '2.14.5'
  gem 'rspec-mocks', '2.14.6'
  gem 'factory_girl_rails', '4.4.0'
  gem 'simplecov', '0.8.2'
  gem 'simplecov-rcov', '0.2.3'
  gem 'ci_reporter', '1.9.1'
  gem 'shoulda', '3.5.0'
end

group :doc do
  gem 'sdoc', '0.4.0', require: false
end
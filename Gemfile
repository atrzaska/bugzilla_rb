source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.1'

gem 'pg', '0.17.1'

gem 'devise', '3.2.3'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'kaminari', '0.15.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks', '2.2.1'
gem 'jbuilder', '~> 1.2'

gem 'slim-rails', '2.1.5'

group :staging, :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
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
  gem 'sdoc', require: false
end
# frozen_string_literal: true
source "https://rubygems.org"

gem "rails", "4.2.5.1"
# rake 11 can break stuff see: http://stackoverflow.com/questions/35893584/nomethoderror-undefined-method-last-comment-after-upgrading-to-rake-11/35893941
gem "rake", "< 11.0"
gem "sass-rails", "~> 5.0"
gem "haml-rails", "~> 0.9"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "therubyracer", platforms: :ruby

gem "font-awesome-sass", "~> 4.5.0"
gem "jquery-rails"
gem "jquery-turbolinks"

gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc

gem "pg"
gem "dotenv-rails"
gem "devise",           "~> 3.5.2"
gem "devise_invitable", "~> 1.5.2"

# Provided by GDS - Template gives us a master layout into which
# we can inject our content using yield and content_for
gem "govuk_template", "~> 0.17.0"

# Access to some of the most common styles and scripts used by GDS
gem "govuk_frontend_toolkit", "~> 4.10.0"

# static pages
gem "high_voltage", "~> 2.4.0"
gem "passenger", "~> 5.0.25", require: false
gem "whenever", require: false

# shared PAFS code
gem "pafs_core", "~> 0.0",
  git: "https://github.com/EnvironmentAgency/pafs_core",
  branch: "develop"

group :development, :test do
  gem "rspec-rails"
  gem "byebug"
  gem "pry"
  gem "guard-rspec", require: false
end

group :development do
  gem "web-console", "~> 2.0"
  gem "letter_opener"
  gem "spring"
  gem "overcommit"
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "shoulda-matchers", "~> 3.1"
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
  gem "simplecov", require: false
  gem "codeclimate-test-reporter", require: false
end

group :production, :edge, :qa, :staging do
  gem "rails_12factor"
  gem "airbrake", "~> 5.0"
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
#gem 'capistrano-rails', group: :development

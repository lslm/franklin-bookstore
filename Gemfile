# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'feature'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.2.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap', '~> 4.3.1'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'devise'
gem 'mail_form'
gem 'omniauth-facebook'
gem 'simple_form'
gem 'will_paginate', '~> 3.1.0'

gem 'aws-sdk-s3', require: false
gem 'rubocop', '~> 0.73.0', require: false

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

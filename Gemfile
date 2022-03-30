# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan', '~> 2.0'
gem 'devise', '~> 4.6.1'
gem 'devise-jwt'
gem 'graphql', '~> 1.9.3'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.2'

# gem 'rack-cors'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'byebug', platforms: %I[mri mingw x64_mingw]
  gem 'pry-rails'
end

group :test do
  gem "json_matchers"
end

group :development do
  gem 'annotate'
  gem 'faker'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %I[mingw mswin x64_mingw jruby]

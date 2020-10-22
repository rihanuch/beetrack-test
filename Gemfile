source 'https://rubygems.org'

gem 'active_model_serializers', '~> 0.9.3'
gem 'bootsnap', require: false
gem 'data_migrate'
gem 'enumerize'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'power-types'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rails-i18n'
gem 'responders'
gem 'sass-rails', '>= 6'
gem 'sidekiq'
gem 'simple_token_authentication', '~> 1.0'
gem 'strong_migrations'
gem 'turbolinks', '~> 5'
gem 'versionist'
gem 'webpacker', '~> 4.0'

group :development do
  gem 'annotate', '~> 3.0'
  gem 'listen'
  gem 'spring'
end

group :test do
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-nc', require: false
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.82.0'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :production do
  gem 'rack-timeout'
end

group :production, :development, :test do
  gem 'tzinfo-data'
end

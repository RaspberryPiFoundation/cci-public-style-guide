ruby '2.2.2'

source 'https://rubygems.org'

gem 'mysql2',    '~> 0.3.18'
gem 'puma',      '~> 2.14.0'
gem 'rails',     '4.2.5.1'
gem 'redcarpet', '~> 3.3.3'
gem 'sass',      '~> 3.4.21'
gem 'uglifier',  '~> 2.7.2'

group :development, :test do
  gem 'byebug'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'rails-dev-tweaks'
end

group :development do
  gem 'foreman',     '~> 0.78.0'
  gem 'quiet_assets'
  gem 'seed_dump'
  gem 'web-console', '~> 2.0'

  gem 'capistrano',             require: false
  gem 'capistrano-rvm',         require: false
  gem 'capistrano3-puma',       require: false
  gem 'slackistrano',           '0.1.10', require: false
  gem 'spring',                 require: false
end

gem 'dotenv-rails', :groups => [:development, :test]

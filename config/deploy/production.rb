server 'styleguide.codeclubworld.org', roles: [:web, :app, :db], primary: true

set :application,        "styleguide.codeclubworld.org"
set :branch,             "master"
set :deploy_to,          "/var/www/styleguide.codeclubworld.org"
set :puma_env,           "production"
set :rails_env,          "production"

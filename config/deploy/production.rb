server 'styleguide.codeclubworld.org', roles: [:web, :app, :db], primary: true

set :application,        "styleguide.codeclubworld.org"
set :branch,             "master"
set :deploy_to,          "/var/www/styleguide.codeclubworld.org"
set :puma_env,           "production"
set :rails_env,          "production"
set :slack_msg_finished, "#{ENV['USERNAME']} deployed branch *#{fetch :branch}* of #{fetch :application} to server *#{fetch :rails_env}*"
set :slack_msg_failed,   "#{ENV['USERNAME']} failed to deployed branch *#{fetch :branch}* of #{fetch :application} to server *#{fetch :rails_env}*"

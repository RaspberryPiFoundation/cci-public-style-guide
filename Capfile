# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'capistrano/rails'
require 'slackistrano'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

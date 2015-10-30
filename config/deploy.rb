set :format,        :pretty
set :keep_releases, 5
set :log_level,     :debug
set :pty,           true
set :repo_url,      "git@github.com:CodeClub/style-guide.git"
set :use_sudo,      false
set :user,          "deploy"

set :ssh_options, {
  forward_agent: true,
  keys:          %w(~/.ssh/id_rsa.pub),
  user:          fetch(:user)
}

set :bundle_flags, '--deployment'

set :rbenv_type,     :system
set :rbenv_ruby,     '2.2.2'
set :rbenv_prefix,   "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles,    :all

# run `cap ENV puma:config` to write any puma config changes
set :puma_env,            fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_preload_app,    true
set :puma_role,           :app
set :puma_threads,        [0, 16]
set :puma_worker_timeout, 30
set :puma_workers,        2

# Linked Files & Directories (Default None):
#set :linked_files, fetch(:linked_files, []).push('public/robots.txt')
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', 'tmp/pids', 'tmp/sockets', 'public/assets', 'public/system')

# Notifications
#set :slack_webhook,      'https://hooks.slack.com/services/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'
#set :slack_run_starting, false
#set :newrelic_user,      ENV['USERNAME']

#after "deploy:updated",  'newrelic:notice_deployment'

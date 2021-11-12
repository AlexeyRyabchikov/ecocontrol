# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'ecocontrol'
set :repo_url, 'git@github.com:AlexeyRyabchikov/ecocontrol.git'

set :deploy_to, '/rest/ecocontrol'

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml'

append :linked_dirs, 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
append :linked_files, 'config/master.key'

# Default value for default_env is {}
set :default_env, { path: '/usr/share/rvm/rubies/ruby-2.7.2/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
namespace :puma do
  desc 'Restart puma'
  task :restart do
    on roles(:app) do
      execute :systemctl, :restart, :puma
    end
  end
end

after 'deploy:finishing', 'puma:restart'



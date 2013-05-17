require "bundler/capistrano"
require 'puma/capistrano'

#set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
#set (:bundle_cmd) { "/home/deployer/.rbenv/shims/bundle" }
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

#application info
set :application, "biopartsdb"

default_run_options[:pty] = true 
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:keys] = ["/Users/giovanni/.ssh/deployer"]

#repository information
set :repository, "https://jhudeployer@bitbucket.org/giapeto/biopartsdb.git"
set :scm, :git
set :scm_username, "jhudeployer"

#deploy information
role :web, "54.243.210.170"                          # Your HTTP server, Apache/etc
role :app, "54.243.210.170"                          # This may be the same as your `Web` server
role :db,  "54.243.210.170", :primary => true        # This is where Rails migrations will run

set :user, "deployer"
set :use_sudo, false
set :deploy_to, "/home/deployer/applications/#{application}"

set :rails_env, :production

#unicorn setup
set :puma_binary, "puma"
set :puma_config, "#{current_path}/config/puma.rb"

namespace :deploy do
  #start task
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} bundle exec #{puma_binary} -C #{puma_config}"
  end
  
  #stop task
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "bundle exec pumactl -S #{current_path}/tmp/pids/puma.state"
  end
  
  #restart task
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
  
  task :pipeline_precompile do
    run "cd #{current_path}; RAILS_ENV=production rake assets:precompile"
  end
end

after "deploy:create_symlink", "deploy:pipeline_precompile"

# remove old releases
after "deploy", "deploy:cleanup"

#application info
set :application, "biopartsdb"

#repository information
set :repository, "https://giapeto@bitbucket.org/giapeto/biopartsdb.git"
set :scm, :git
set :scm_username, "giapeto"

#deploy information
set :scm, "deployer"
set :use_sudo, false
set :deploy_to, "/home/deployer/applications/#{application}"

role :web, "128.220.138.86"                          # Your HTTP server, Apache/etc
role :app, "128.220.138.86"                          # This may be the same as your `Web` server
role :db,  "128.220.138.86", :primary => true        # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
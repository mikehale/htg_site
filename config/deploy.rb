set :application, "site"
set :domain, "slice.halethegeek.com"
set :repository, "git@github.com:mikehale/htg_site.git"
set :deploy_to, "/var/www/apps/#{application}"

set :user, "deploy"
set :use_sudo, false
set :rails_env, "production" 
set :scm, "git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :keep_releases, 10
default_run_options[:pty] = true

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# after "deploy:update", "gems:install"
# 
# namespace :gems do
#   task :install do
#     sudo "sh -c'cd #{current_path} && rake gems:install'"
#   end  
# end

after "deploy:symlink", "symlink_database_yml"

task :symlink_database_yml do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"  
end

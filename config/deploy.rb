set :application, "site"
set :domain, "slice.halethegeek.com"
set :repository, "git@github.com:mikehale/ignite_same.git"

set :user, "deploy"
set :rails_env, "production" 
set :scm, "git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :keep_releases, 10
default_run_options[:pty] = true

role :web, domain
role :app, domain
role :db,  domain, :primary => true

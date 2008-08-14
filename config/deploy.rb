set :default_stage, "production"

require 'capistrano/ext/multistage'
require 'spacesuit/recipes/multistage_patch'
require 'spacesuit/recipes/common'

set :application, "site"
set :repository, "git@github.com:mikehale/htg_site.git"

set :use_sudo, false
set :rails_env, "production" 
set :scm, "git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :keep_releases, 10
default_run_options[:pty] = true

namespace :thin do
  %w{start stop restart}.each {|action|
    desc "#{action} thin"
    task action.to_sym do
      run "cd #{current_path} && 
            sudo thin #{action} --config /etc/thin/site.yml"
    end
  }
end

namespace :deploy do
  %w(start stop restart).each do |action|
    task action.to_sym do 
      thin.send action 
    end
  end
end
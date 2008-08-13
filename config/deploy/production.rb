set :deploy_to, "/var/www/apps/#{application}"
set :domain, "slice.halethegeek.com"
set :user, "deploy"

role :web, domain
role :app, domain
role :db,  domain, :primary => true

task :install_gem_dependencies do
  run "cd #{current_path} && 
        rake gems RAILS_ENV=#{rails_env} > /dev/null &&
        sudo rake gems:install RAILS_ENV=#{rails_env}"
end

task :link_shared_stuff do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{shared_path}/config/cookie_secret #{release_path}/config/cookie_secret"
  
  run "mkdir -p #{release_path}/tmp"
  run "mkdir -p #{release_path}/db"
end

after "deploy:symlink", "link_shared_stuff"
after "deploy:symlink", "install_gem_dependencies"
before "deploy:update_code", "deploy:git:pending"
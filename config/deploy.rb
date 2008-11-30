set :application, "cuteadmin"
set :repository, "git://github.com/jana4u/cute_admin_example.git"
set :scm, "git"
set :git_enable_submodules, 1

role :web, "server3.railshosting.cz"
role :app, "server3.railshosting.cz"
role :db,  "server3.railshosting.cz", :primary => true

set :deploy_to, "/home/cuteadmin/app/"
set :user, "cuteadmin"

set :use_sudo, false

after "deploy:migrations", :populate_database, :generate_cute_admin

=begin
task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end
=end

desc "Insert sample data into database"
task :populate_database, :roles => :db do
  rails_env = fetch(:rails_env, "production")
  run "cd #{latest_release}; rake RAILS_ENV=#{rails_env} db:populate"
end

desc "Generate cute_admin administration for all models, including associations"
task :generate_cute_admin, :roles => :app do
  rails_env = fetch(:rails_env, "production")
  run "cd #{latest_release}; rake RAILS_ENV=#{rails_env} cute_admin:generate_with_associations"
end

namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{latest_release}/tmp/restart.txt"
  end
end
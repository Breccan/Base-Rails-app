set :application, "set your application name here"
set :repository,  "set your repository location here"

set :scm, :subversion
set :stages, %w(test, production, ci)
set :default_stage, 'test'
require 'capistrano/ext/multistage'

after :deploy, "init:set_permissions"

namespace :deploy do

  task :restart, :roles => :app do
    # restart your web server here
    sudo "/usr/sbin/apache2ctl graceful"
  end

end

namespace :init do

  task :set_permissions, :except => { :no_release => true } do
    # chown the new directory to www-data:www-data
    sudo "chown -R www-data:www-data #{latest_release}"
  end

end

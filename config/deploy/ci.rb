set :application, "App Name"
set :rails_env, 'ci'
ENV['RAILS_ENV'] = RAILS_ENV = rails_env

set :default_environment, {"RAILS_ENV" => rails_env}
puts "*** Deploying to \033[1;41m #{fetch(:rails_env)} \033[0m"
role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"
set :deploy_to, '/var/lib/rails/%s' % application
set :user, 'root'

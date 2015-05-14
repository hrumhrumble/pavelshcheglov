set :scm, :git
set :repo_url, 'git@github.com:hrumhrumble/pavelshcheglov.git'

set :use_sudo, false
set :rvm_type, :user
set :keep_releases, 5

set :linked_files, %w{config/secrets.yml config/unicorn.rb config/database.yml db/seed.rb}
set :linked_dirs, %w{log tmp vendor/bundle public/assets public/system}

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'unicorn:duplicate'

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
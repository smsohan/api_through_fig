lock '3.3.5'

set :application, 'api_through_fig'
set :repo_url, 'git@github.com:smsohan/api_through_fig.git'

set :pty, true
set :default_env, { SECRET_KEY_BASE:  ENV['SECRET_KEY_BASE'] }

namespace :deploy do
  task :fig_up do
    on roles(:app) do
      puts "fetch(:current_path) = #{current_path}"
      within current_path do
        execute :fig, 'up -d'
      end
    end
  end
end

after "deploy:finished", "deploy:fig_up"

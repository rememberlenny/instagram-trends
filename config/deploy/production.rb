set :branch, ENV.fetch("CAPISTRANO_BRANCH", "master")
set :mb_sidekiq_concurrency, 1

server "instagram-trends.herokuapp.com",
       :user => "deployer",
       :roles => %w[app backup cron db redis sidekiq web]

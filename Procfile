web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -e production -c 3
worker: bundle exec sidekiq -e development -c 3
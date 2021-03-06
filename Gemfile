source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem 'sidekiq'
gem 'httparty', '~> 0.13.7'
gem 'sinatra'
gem 'ruby-jmeter', '~> 2.13', '>= 2.13.10'
gem 'signet', '~> 0.8.1'
gem 'redis-rails'
gem 'google-api-client', '~> 0.9'
gem 'twitter-bootstrap-rails'
gem 'capybara-screenshot'
#gem 'mechanize', '~> 2.7', '>= 2.7.5'
gem 'watir'
gem 'listen', '~> 3.1', '>= 3.1.1'
gem 'poltergeist'
gem 'capybara'
gem "omniauth-google-oauth2", :git => 'https://github.com/zquestz/omniauth-google-oauth2', :branch => 'master'
# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
  gem 'byebug'
end

group :production do
  gem 'pg'
end
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'nokogiri', '~> 1.6', '>= 1.6.6.2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'rvt'
  gem 'rails-web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

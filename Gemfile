source 'https://rubygems.org'
ruby '2.3.0'
gem 'awesome_print'
gem 'rails-api'

gem 'newrelic_rpm'

# To use ActiveModel has_secure_password
gem 'bcrypt'

gem 'passenger'

gem 'jsonapi-resources'

gem 'rack-cors', :require => 'rack/cors'

gem 'pg'

gem 'slack-notifier'

gem 'responders'

gem 'postmark-rails', '~> 0.12.0'

gem 'groupdate', '~> 2.5'

gem 'uglifier', '~> 3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
end

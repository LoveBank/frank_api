source 'https://rubygems.org'
ruby '2.3.0'
gem 'frank', :git => 'git://github.com/LoveBank/frank.git'
gem 'rails', "~> 4.2.5"

gem 'rails-api'

gem 'newrelic_rpm'

# To use ActiveModel has_secure_password
gem 'bcrypt'

gem 'passenger'

gem 'jsonapi-resources'

gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'awesome_print'
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
  gem 'pg'
end

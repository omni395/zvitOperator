source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails' # , '4.2.6'
# Use sqlite3 as the database for Active Record
gem 'pg'
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier' #, '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails' #, '~> 4.1.0'
gem 'coffee-script-source', '1.8.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder' #, '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc' #, '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt' #, '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console' #, '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem "rails_12factor"
end

group :test, :development do
  gem "factory_girl_rails"
  gem 'rspec-rails'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'capybara'
end

gem 'devise'
gem 'cancancan'
gem "bootstrap", '~> 4.0.0.alpha6'
gem 'autoprefixer-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'execjs'
gem 'will_paginate-bootstrap'

# convert to pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'


#gem 'rails_admin'
#gem 'bootstrap-wysihtml5-rails'
#gem 'dragonfly'
#gem 'ckeditor'
# gem 'russian'
# gem 'pacecar'

group :development do
  gem 'listen'
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-chruby', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
end

ruby "2.4.0"
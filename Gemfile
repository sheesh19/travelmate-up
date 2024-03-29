source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'autoprefixer-rails'
gem "font-awesome-sass", "~> 6.1"
gem 'simple_form'
gem 'devise'
gem 'pundit'
gem 'turbolinks_render'
gem 'rexml'
gem 'psych', '< 4'

# NESTED OBJECTS
gem 'cocoon'

# TAGS
gem 'acts-as-taggable-on', '~> 7.0'

# FAVORITES
gem 'acts_as_favoritor'

# CODE REVIEW
gem 'reek'
gem 'flog'

# LOCATION
gem 'geocoder'

# PHOTO
gem 'cloudinary', '~> 1.16.0'

# GROUP DATE
gem 'groupdate'
gem "simple_calendar", "~> 2.0"

# PG SEARCH
gem 'pg_search'

# GOOGLE PHOTOS
gem 'google_places'

# PWA
gem 'webpacker-pwa'

# ANIMATE.CSS
gem 'animate.css-rails'

# OMNIAUTH

gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

# PAGY
gem 'pagy'

# VONAGE
gem 'opentok'



# gem 'google-api-client', require: 'google/apis/calendar_v3'




group :development, :test do  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'
  # Testing Suite
  gem 'rspec-rails'
  gem 'database_cleaner-active_record'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'timecop'
  gem 'simplecov'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do  gem 'bullet'
  gem 'rack-mini-profiler'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

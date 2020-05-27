source 'http://rubygems.org'

gem 'rails', '3.1.6'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'activerecord-jdbcsqlite3-adapter'
gem 'jquery-rails'
gem 'jruby-openssl'
gem 'json'

gem 'sunspot_rails'

gem 'jruby-rack'
gem 'warbler'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :production do
  gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development
  gem 'turn', '< 0.8.3'
  gem 'capybara'
end

gem 'rspec-rails'

gem 'rspec'
gem 'will_paginate'

group :production do
  gem 'execjs'
  #gem 'memcache'
  #  #gem 'dalli'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'


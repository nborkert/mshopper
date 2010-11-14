# add support for memcached
# config.gem 'dalli', :lib => 'memcached'
# require 'memcached'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Heroku::Application.initialize!

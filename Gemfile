source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'rest-client'
gem "shoulda"
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'omniauth-taskrabbit' #for Task Rabbit API
gem 'taskrabbit' # for posting sandwich orders to task rabbit
gem 'devise'
gem 'ordrin' # for posting orders to ordr.in
gem 'ordr.in-cli' 
gem 'pamfaxr' # for faxing to Waiters on Wheels
gem 'json'
gem  'mime-types'


group :development, :test  do
  gem 'quiet_assets'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'simplecov'
  gem "rspec"
  gem 'faker'
  gem 'capybara'
  gem 'fabrication'
  gem 'launchy'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
  gem 'pg'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

source 'https://rubygems.org'
ruby "2.2.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.2.0'
gem 'bcrypt', '3.1.9'
gem 'faker', '1.4.2'
gem 'carrierwave', '0.10.0'
gem 'mini_magick', '3.8.0'
gem 'fog', '1.23.0'
gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass', '3.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '4.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.5.3'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~>4.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'rails-html-sanitizer', '1.0.1'


gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'

#gem 'cancancan'

gem 'aws-sdk'
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"

gem 'figaro'

group :development do
  gem 'sqlite3',     '1.3.10'
  gem 'byebug',      '3.5.1'
  gem 'web-console', '2.0.0'
  gem 'spring',      '1.2.0'
  #gem 'debugger'
  gem 'railroady'
  gem 'jasmine-rails'
end

group :test do
  gem 'minitest-reporters',   '1.0.8'
  gem 'mini_backtrace',       '0.1.3'
  gem 'guard-minitest',       '2.3.2'
  gem 'rspec-rails',          '3.1.0'
  gem 'simplecov',            :require => false
  gem 'cucumber-rails',       :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'metric_fu'

end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.3'
  gem 'puma',        '~>2.11.1'
end

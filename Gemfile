source 'https://rubygems.org/'

ruby '2.3.3'

gem 'rails', '5.0.0.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'foundation-rails'
gem 'dotenv-rails'
gem 'devise'
gem 'faker'
gem "carrierwave"
gem "sendgrid-ruby"
gem 'puma'
gem 'codeclimate-yaml', '~> 0.12.0'

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  # gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
  # gem 'faker'
end

group :production do
  gem 'rails_12factor'
end

source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '~> 4.2.0'
gem 'puma'

gem 'mongoid', '~> 5.0.0'

gem 'etcd-env'
gem 'newrelic_rpm'
gem 'sentry-raven'

group :test, :development do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.1'
end

group :development do
  gem 'reek'
  gem 'rubocop'
end

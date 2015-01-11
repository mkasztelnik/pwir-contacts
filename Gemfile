source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'rails-api'
gem 'pg'

gem 'active_model_serializers', '~>0.8.0'
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'guard-rspec', require: false
  gem 'guard-spring'
  gem 'spring-commands-rspec'

  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'faker'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

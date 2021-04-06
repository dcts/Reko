source 'https://rubygems.org'
ruby '2.6.7'

gem 'bootsnap', require: false
gem 'devise', ">= 4.7.1"
gem 'jbuilder', '~> 2.0'
gem 'pg', '~> 0.21'
gem 'puma'
gem 'rails', '~> 6.0.0'
gem 'redis'

gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 5.6.1'
gem 'sassc-rails'
gem 'simple_form'
gem 'uglifier'
gem 'webpacker'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'rails_real_favicon'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails'
  gem 'faker' # ADD FAKER for fake seed data
end

# ADD RENAME GEM (to rename rails application properly)
# why? -> it wont let you create a model with the same name
# as your apps name. And we need "reko" as model
gem 'rename'

# for scheduling a CRONJOB that resets the testaccount every day in the night
gem 'rufus-scheduler', '~> 3.2'

# for testing (upgraded stack also to 20, before it was 18)
gem 'httparty'

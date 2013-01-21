source 'https://rubygems.org'

gem 'rails', '3.2.11'

# to get Twitter Bootstrap framework for web design
gem 'bootstrap-sass', '2.1'
## this is for crypted password
gem 'bcrypt-ruby', '3.0.1'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  # dyc guard so we can do test automatically, see Listing 3.33
  gem 'guard-rspec', '1.2.1'
  ## add sport to speed up test, see section 3.6.3
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
  gem 'factory_girl_rails', '4.1.0'
end

## this will add annotation to model rb files, just comments
group :development do
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'

  # therubyracer 0.11.1beta8 causes problem so use older version" 
  # put therubyracer under assets because we are not a product yet?
  gem 'therubyracer', '<0.11.0'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'
  # dyc add the following two lines as List 3.33
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
end

group :production do
  gem 'pg', '0.12.2'
end

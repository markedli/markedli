require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

source 'http://rubygems.org'

gem 'rails', '3.2.2'
# Database
gem "bson_ext", ">= 1.4.0"
gem "mongoid", ">= 2.3.0"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '>= 3.1.4'
  gem 'coffee-rails', '>= 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'

# install a Javascript runtime for linux
if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.8.2'
end
# Front end goodies
gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "rails-footnotes", ">= 3.7", :group => :development

# Tools & libs
gem "devise", "~> 2.0.4"

# Testing & Development with guard
gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "cucumber-rails", ">= 1.1.1", :group => :test
gem "accept_values_for", ">= 0.4.3", :group => :test
gem 'mongoid-rspec', ">= 1.4.4", :group => :test
gem "factory_girl_rails", ">= 1.3.0", :group => :test
gem "capybara", ">= 1.1.1", :group => :test
gem "launchy", ">= 2.0.5", :group => :test
gem "simplecov", ">= 0.5.4", :require => false, :group => :test
# guard
gem "guard", ">= 0.6.2", :group => :development
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development

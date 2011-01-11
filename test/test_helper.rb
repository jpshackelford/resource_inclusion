require 'rubygems'
require 'ruby-debug'


require 'bundler'

Bundler.setup

require 'test/unit'
require 'mocha'


ENV["RAILS_ENV"] = "test"
RAILS_ROOT = "anywhere"

require 'active_support'
require 'active_model'
require 'action_controller'
require 'action_dispatch'
# require "rails/railtie"

class ApplicationController < ActionController::Base; end

ActionController::Base.view_paths = File.join(File.dirname(__FILE__), 'views')
 
TestRoutes = ActionDispatch::Routing::RouteSet.new
TestRoutes.draw do
  resources 'comments'
end

# Add Resource Inclusion to load path and load the main file
$:.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'resource_inclusion'

class ApplicationController < ActionController::Base
  
  resource_inclusion
  
  include ::TestRoutes.url_helpers
end

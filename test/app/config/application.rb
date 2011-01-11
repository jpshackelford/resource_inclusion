require File.expand_path('../boot', __FILE__)

require 'rails/all'

$:.unshift File.expand_path(File.dirname(__FILE__) + '/../../../lib')
require 'resource_inclusion'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module App
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
  end
end

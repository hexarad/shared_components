require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)
require "hexarad_shared_components"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f
    config.eager_load = false
  end
end
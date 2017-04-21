require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Praeceptor
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths += %W(#{ config.root }/app)
  end
end

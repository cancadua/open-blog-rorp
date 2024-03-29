require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_text/engine"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Chat
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end

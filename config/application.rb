require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trickster
  class Application < Rails::Application
    config.time_zone = 'Moscow'

    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :ru

    %w(app/services lib).each do |path|
      config.autoload_paths << config.root.join(path).to_s
    end

    config.active_job.queue_adapter = :sidekiq

    config.assets.precompile << %w(biovision/base/**/*)
  end
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module StudentBook
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.precompile += %w( .svg .eot .woff .ttf .png .jpg .gif)
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components', 'bower_components')
  end
end

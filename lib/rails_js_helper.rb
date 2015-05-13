require "rails_js_helper/version"

require 'active_support/configurable'

module RailsJsHelper
  include ActiveSupport::Configurable

  config.images = []
  config.assets = []

  config.configs = {}

  class << self
    def image_path_table
      Hash[
        config.images.map do |path|
          [path, ActionController::Base.helpers.image_path(path)]
        end
      ]
    end

    def asset_path_table
      Hash[
        config.assets.map do |path|
          [path, ActionController::Base.helpers.image_path(path)]
        end
      ]
    end

    def named_route_table
      Rails.application.routes.named_routes
        .select { |name, route| (route.parts - route.optional_parts).empty? }
        .map {|name, route| [name, Rails.application.routes.url_helpers.send("#{name}_path")] }
        .to_h
    end

    def config_table
      config.configs
    end
  end
end

require 'rails'
require "rails_js_helper/engine"

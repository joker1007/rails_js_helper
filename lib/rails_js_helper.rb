require "rails_js_helper/version"

require 'active_support/configurable'

module RailsJsHelper
  class << self
    def image_path_table
      images = load_config["images"].to_a
      Hash[
        images.map do |path|
          [path, ActionController::Base.helpers.image_path(path)]
        end
      ]
    end

    def asset_path_table
      assets = load_config["assets"].to_a
      Hash[
        assets.map do |path|
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
      load_config["configs"] || {}
    end

    private

    def load_config
      if config_file.exist?
        YAML.load(ERB.new(config_file.read).result)
      else
        {}
      end
    end

    def config_file
      Rails.root.join("config", "rails_js_helper.yml")
    end
  end
end

require 'rails'
require "rails_js_helper/engine"

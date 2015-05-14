module RailsJsHelper
  class ConfigGenerator < ::Rails::Generators::Base
    # Copied files come from templates folder
    source_root File.expand_path('../templates', __FILE__)

    # Generator desc
    desc <<-DESC
        Creates a default rails_js_helper.yml configuration file in your app's config
        folder.
    DESC

    def copy_initializer_file
      copy_file "rails_js_helper.yml", "config/rails_js_helper.yml"
    end
  end
end

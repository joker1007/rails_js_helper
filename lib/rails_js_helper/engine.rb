module RailsJsHelper
  class Engine < ::Rails::Engine
    initializer "rails_js_helper-preprocessor", after: "sprockets.environment" do
      Rails.application.assets.register_preprocessor "application/javascript", :"rails_js_helper-dependency" do |context, source|
        if context.logical_path == "rails_helper"
          if Rails.root.join("config", "initializers", "rails_js_helper.rb").exist?
            context.depend_on(Rails.root.join("config", "initializers", "rails_js_helper.rb").to_path)
          end
          context.depend_on(Rails.root.join("config", "routes.rb").to_path)
        end
        source
      end
    end
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails_js_helper'
require 'dummy_rails_helper'
require 'rspec/rails'
require 'capybara/rspec'
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist

RailsJsHelper.configure do |c|
  c.assets += %w(scaffold.css)
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_js_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_js_helper"
  spec.version       = RailsJsHelper::VERSION
  spec.authors       = ["joker1007"]
  spec.email         = ["kakyoin.hierophant@gmail.com"]

  spec.summary       = %q{Add Rails asset helper and named_route helper for JavaScript}
  spec.description   = %q{Add Rails asset helper and named_route helper for JavaScript}
  spec.homepage      = "https://github.com/joker1007/rails_js_helper"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", ">= 3.2"
  spec.add_runtime_dependency "rails-assets-URIjs"
  spec.add_runtime_dependency "coffee-rails", ">= 3.2"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "poltergeist"
  spec.add_development_dependency "uglifier"
end

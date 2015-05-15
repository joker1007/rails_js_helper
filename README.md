# RailsJsHelper
[![Build Status](https://travis-ci.org/joker1007/rails_js_helper.svg)](https://travis-ci.org/joker1007/rails_js_helper)

this gem define `RailsHelper` on JS.
this gem embeds `image_path`, `asset_path` and routing table on compile timing on `rails_helper.js.coffee.erb.`

`RailsHelper` has some functions.


## Limitation
this gem can use only no segments named routes.

ex.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :users
  end
end
```

can use only `users`, `new_user`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_js_helper'
```

*Caution* this gem requires `rails-assets-URIjs`.

And then execute:

    $ bundle

## Usage

```sh
$ bundle exec rails g rails_js_helper:config

# And edit config/rails_js_helper.yml
```

```yml
images:
  - loading.png
assets:
  - loading.css
configs:
  google_api_key: <%= Rails.application.config.x.google_api_key %>
```

```coffee
#= require rails_helper

RailsHelper.imagePath("loading.png") # => "/assets/loading.png"
RailsHelper.imageTag("loading.png", width: 120) # => <img src="loading.png" width="120">
RailsHelper.assetPath("users.css") # => /assets/users.css
RailsHelper.pathFor("users", format: "json", foo: "bar") # => "/users.json?foo=bar"
RailsHelper.pathFor("new_users") # => "/users/new"
RailsHelper.routeNames() # show all route names on javascript
RailsHelper.config.google_api_key # => value of `Rails.application.config.x.google_api_key`
```

## Functions

### RailsHelper.imagePath(path)
### RailsHelper.imageTag(path, attributes={})
### RailsHelper.pathFor(routeName, query={})
### RailsHelper.routeNames()
### RailsHelper.config

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/joker1007/rails_js_helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

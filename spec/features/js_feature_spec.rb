require 'spec_helper'

RSpec.feature "RailsHelper", js: true do
  scenario "is compiled properly" do
    visit "/users"

    expect(page.evaluate_script "RailsHelper.named_route('users')")
      .to eq "/users"

    expect(page.evaluate_script "RailsHelper.named_route('users', {'format': 'json'})")
      .to eq "/users.json"

    expect(page.evaluate_script "RailsHelper.asset_path('scaffold.css')")
      .to eq "/users"
  end
end

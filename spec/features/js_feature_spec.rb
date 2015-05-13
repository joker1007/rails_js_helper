require 'spec_helper'

RSpec.feature "RailsHelper", js: true do
  scenario "is compiled properly" do
    visit "/users"

    expect(page.evaluate_script "RailsHelper.named_route('users')")
      .to eq "/users"

    expect(page.evaluate_script "RailsHelper.named_route('users', {'format': 'json'})")
      .to eq "/users.json"

    expect(page.evaluate_script "RailsHelper.route_names()")
      .to match_array ["users", "new_user"]

    expect(page.evaluate_script "RailsHelper.asset_path('scaffold.css')")
      .to eq "/assets/scaffold.css"

    expect(page.evaluate_script "RailsHelper.image_path('dummy.png')")
      .to eq "/assets/dummy.png"

    expect(page.evaluate_script "RailsHelper.image_tag('dummy.png', {'width': '120'})")
      .to eq "<img src=\"/assets/dummy.png\" width=\"120\">"
  end
end

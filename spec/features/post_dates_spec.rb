require 'rails_helper'
require 'date'

RSpec.feature "Timeline", type: :feature do
  scenario "User can see the date a post was created" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world! - #{Date.today.to_s}")
  end
end

require 'rails_helper'
require 'date'

RSpec.feature "Format", type: :feature do
  scenario "User can use newlines in posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nHello back at ya!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!\nHello back at ya! - #{Date.today.to_s}")
  end
end

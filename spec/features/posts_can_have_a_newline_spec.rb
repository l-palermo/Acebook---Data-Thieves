require 'rails_helper'
require 'date'

RSpec.feature "Format", type: :feature do
  scenario "User can use newlines in posts" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "See all posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nHello back at ya!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!\nHello back at ya! - #{Date.today.to_s}")
  end
end

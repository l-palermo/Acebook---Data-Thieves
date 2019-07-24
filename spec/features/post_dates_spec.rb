require 'rails_helper'
require 'date'

RSpec.feature "Timeline", type: :feature do
  scenario "User can see the date a post was created" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(page).to have_content('Welcome test you are successfully signed up')
    click_link 'See all posts'
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world! - #{Date.today.to_s}")
  end
end

require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can view posts ordered by date" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(page).to have_content('Welcome test')
    click_link 'New post'
    fill_in "Message", with: "This is message 1"
    click_button "Submit"
    click_link 'New post'
    fill_in "Message", with: "This is message 2"
    click_button "Submit"
    expect(page).to have_content("This is message 2 - #{Date.today.to_s}\nThis is message 1 - #{Date.today.to_s}")
  end
end

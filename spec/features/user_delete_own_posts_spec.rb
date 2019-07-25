require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"
    click_link 'Hello'
    click_link 'Delete'
    expect(page).to have_content('Welcome test')
    expect(page).not_to have_content('Hello')
  end

  scenario "Can submit posts and view them" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"
    click_link 'Hello'
    click_link 'Delete'
    expect(page).to have_content('Welcome test')
    expect(page).not_to have_content('Hello')
  end


end
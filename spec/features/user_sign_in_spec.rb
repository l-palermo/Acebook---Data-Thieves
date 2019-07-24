require "rails_helper"
require 'sign_up_helper'

RSpec.feature "User Sign In", type: :feature do
  scenario "when logged in, redirects to /posts" do
    user = User.create(name:"Remzilla", surname:"Kaiju", email:"test@test.com", password:"1234567")
    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    expect(current_path).to eq("/users/#{user.id}/posts") 
  end

  scenario "User login sees their posts", type: :feature do
    user = User.create(name:"Remzilla", surname:"Kaiju", email:"test@test.com", password:"1234567")
    user.posts.create(message:"Who has the keys to my Bimma?")
    user2 = User.create(name:"Boris", surname:"Johnny", email:"anothertest@test.com", password:"itsasecret")
    user2.posts.create(message: "I will sell you my mother for power")
    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    expect(page).to have_content('Who has the keys to my Bimma?')
    expect(page).not_to have_content('I will sell you my mother for power')
  end

  scenario "Throws an error if email is invalid" do
      visit '/'
      fill_in 'session_email',      with: 'test'
      fill_in 'session_password',  with: 'testey'
      click_button 'Log in'
      expect(current_path).to eq('/login')
      expect(page).to have_content('Invalid email/password combination')
  end
end

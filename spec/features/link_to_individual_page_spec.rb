require "rails_helper"
require 'sign_up_helper'

RSpec.feature "User can visit individual page", type: :feature do
  scenario "User is on all posts and can click on link to individual post page" do
    user = User.create(name:"Remzilla", surname:"Kaiju", email:"test@test.com", password:"1234567")
    user.posts.create(message:"Who has the keys to my Bimma?")
    user2 = User.create(name:"Boris", surname:"Johnny", email:"anothertest@test.com", password:"itsasecret")
    user2_post = user2.posts.create(message: "I will sell you my mother for power")
    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    click_link 'All Posts'
    click_link "I will sell you my mother for power"
    expect(current_path).to eq("/users/#{user.id}/posts/#{user2_post.id}")
    expect(page).to have_content("I will sell you my mother for power")
  end
end

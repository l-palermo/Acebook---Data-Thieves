require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit '/'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(current_path).to eq('/posts')
    
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

require "rails_helper"
require 'sign_up_helper'

RSpec.feature "User Sign In", type: :feature do

  xscenario "when logged in, redirects to /posts" do
    sign_up
    p 'ive managed to sign up'

    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: 'password', visible: false
    p 'after filling in'
    click_button 'Log in'
    p 'hello'

    expect(page).to have_content 
  end

  xscenario "User gets redirected to root if he is not logged in", type: :feature do
    visit '/'
    visit '/posts'
    expect(page).to have_current_path '/'
  end

  xscenario "User email validation - throws an error if no @ included", type: :feature do
    visit '/'
    fill_in 'session_email', with: 'test', visible: false
    fill_in 'session_password', with: 'password', visible: false
    click_button 'Log in'
    expect(page).to raise_error('Please include an @ in the email address')
  end
end

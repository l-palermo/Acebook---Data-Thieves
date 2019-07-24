require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(page).to have_content("Welcome test you are successfully signed up")
  end

  scenario "Throws an error if name is missing" do
    visit '/users/new'
    fill_in 'user_name',      with: ''
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Name can\'t be blank')
  end

  scenario "Throws an error if email is missing" do
    visit '/users/new'
    fill_in 'user_name',      with: 'Joe'
    fill_in 'user_email',     with: ''
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario "Throws an error if email is invalid" do
    visit '/users/new'
    fill_in 'user_name',      with: 'Joe'
    fill_in 'user_email',     with: 'testemail.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is invalid')
  end

  scenario "Throws an error if password is missing" do
    visit '/users/new'
    fill_in 'user_name',      with: 'Joe'
    fill_in 'user_email',     with: 'email.com'
    fill_in 'user_password',  with: ''
    click_button 'Create my account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password can\'t be blank')
  end

  scenario "Throws an error if password is too short" do
    visit '/users/new'
    fill_in 'user_name',      with: 'Joe'
    fill_in 'user_email',     with: 'test@gmail.com'
    fill_in 'user_password',  with: '123'
    click_button 'Create my account'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end
end

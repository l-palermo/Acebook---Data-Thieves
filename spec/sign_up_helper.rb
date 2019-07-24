def sign_up
  visit "/users/new"
  fill_in "user_name", with: "Faisal"
  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "password"
  # fill_in "Password confirmation", with: "password"
  click_button "Create my account"
end

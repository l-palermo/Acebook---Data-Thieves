require 'timecop'

RSpec.feature "User can update a post", type: :feature do
  scenario "User can update a post within 10 mins of creation" do
    user = User.create(name:"Jean-Claude", surname:"Van Damme", email:"doublehard@test.com", password:"1234567")
    post = user.posts.create(message:"All my plumbing is coconut water")
    visit '/'
    fill_in 'session_email', with: 'doublehard@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    click_link 'All my plumbing is coconut water'
    click_link 'Edit'
    fill_in "Message", with: "You see, I'm an ambitious Harvard-educated visionary who deserves to be the most powerful man in the world"
    click_button 'Update'
    expect(page).to have_content("You see, I'm an ambitious Harvard-educated visionary who deserves to be the most powerful man in the world")
    expect(page).not_to have_content("All my plumbing is coconut water")
  end
end


RSpec.feature "User cannot edit someone elses update a post", type: :feature do
  scenario "User cannot update someone else's post" do
    user = User.create(name:"Jean-Claude", surname:"Van Damme", email:"doublehard@test.com", password:"1234567")
    post = user.posts.create(message:"All my plumbing is coconut water")
    user2 = User.create(name:"Dolph", surname:"Lungren", email:"iloveart@test.com", password:"1234567")
    post2 = user2.posts.create(message:"You are discharged sarge")
    visit '/'
    fill_in 'session_email', with: 'doublehard@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    click_link 'All Posts'
    click_link 'You are discharged sarge'
    click_link 'Edit'
    fill_in "Message", with: "I will defeat you"
    click_button 'Update'
    expect(page).to have_content("Error: you can\'t update other users messages")
  end
end

RSpec.feature "User can update a post", type: :feature do
  scenario "User can update a post within 10 mins of creation" do
    user = User.create(name:"Jean-Claude", surname:"Van Damme", email:"doublehard@test.com", password:"1234567")
    post = user.posts.create(message:"All my plumbing is coconut water")
    new_time = Time.now.utc + 11.minutes
    Timecop.travel(new_time)
    visit '/'
    fill_in 'session_email', with: 'doublehard@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    click_link 'All my plumbing is coconut water'
    click_link 'Edit'
    fill_in "Message", with: "You see, I'm an ambitious Harvard-educated visionary who deserves to be the most powerful man in the world"
    click_button 'Update'
    expect(page).to have_content("Error: you can\'t update a post since it has been 10 minutes since it was created")
    Timecop.return
  end
end
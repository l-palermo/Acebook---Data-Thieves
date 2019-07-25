RSpec.feature "User Sign In", type: :feature do
  scenario "User login sees all posts", type: :feature do
    user = User.create(name:"Remzilla", surname:"Kaiju", email:"test@test.com", password:"1234567")
    user.posts.create(message:"Who has the keys to my Bimma?")
    user2 = User.create(name:"Boris", surname:"Johnny", email:"anothertest@test.com", password:"itsasecret")
    user2.posts.create(message: "I will sell you my mother for power")
    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    visit '/posts'
    expect(page).to have_content('Who has the keys to my Bimma?')
    expect(page).to have_content('I will sell you my mother for power')
 end
end
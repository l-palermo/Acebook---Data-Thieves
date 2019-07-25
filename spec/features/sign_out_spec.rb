

RSpec.feature "User Sign Out", type: :feature do
  scenario "when a user signs out they can no longer view all posts" do
    user = User.create(name:"Remzilla", surname:"Kaiju", email:"test@test.com", password:"1234567")
    visit '/'
    fill_in 'session_email', with: 'test@test.com', visible: false
    fill_in 'session_password', with: '1234567', visible: false
    click_button 'Log in'
    expect(current_path).to eq("/users/#{user.id}/posts")
    visit '/posts'
    expect(current_path).to eq("/posts")
    click_button 'Log Out'
    expect(current_path).to eq("/")
    visit '/posts'
    expect(current_path).to eq("/")
  end
end
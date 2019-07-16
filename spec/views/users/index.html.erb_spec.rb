require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :surname => "Surname",
        :encrypted_email => "Encrypted Email",
        :encrypted_password => "Encrypted Password"
      ),
      User.create!(
        :name => "Name",
        :surname => "Surname",
        :encrypted_email => "Other Encrypted Email",
        :encrypted_password => "Encrypted Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Email".to_s, :count => 1
    assert_select "tr>td", :text => "Other Encrypted Email".to_s, :count => 1
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
  end
end

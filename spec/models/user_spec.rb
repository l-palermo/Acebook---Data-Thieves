require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  def setup 
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  it 'is a valid user' do

    expect(@user).to be(true)
  end
end

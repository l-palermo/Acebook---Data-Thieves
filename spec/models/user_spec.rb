require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'is a valid user' do
    user = User.create name: "Example User", email: "user@example.com", password: 'testing'
    expect(User.all[0]).to eq(user)
  end

  it 'name has to be a valid parameter' do
    user = User.create name: "", email: "user@example.com", password: 'testing'
    expect(User.all[0]).not_to eq(user)
  end

  it 'email has to be a valid parameter' do
    user = User.create name: "Example User", email: "", password: 'testing'
    expect(User.all[0]).not_to eq(user)
  end

  it 'should be a valid email structure' do
    user = User.create name: "Example User", email: "examplegmail.com", password: 'testing'
    expect(User.all[0]).not_to eq(user)
  end


  it 'password has to be a valid parameter' do
    user = User.create name: "Example User", email: "user@example.com", password: ''
    expect(User.all[0]).not_to eq(user)
  end


  it 'password has to have length between 6-10' do
    user = User.create name: "Example User", email: "examplegmail.com", password: 'tedwhjqdowpeoidhst'
    expect(User.all[0]).not_to eq(user)
  end
end

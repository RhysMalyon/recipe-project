# Unit test for users.
require 'rails_helper'
require_relative '../app/models/user'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }

  it 'has a username' do
    expect(user.username).to eq('Larry')
  end

  it 'has a valid email address' do
    expect(user.email).to eq('larry@jokeaddress.com')
    # user.email = 'something else'
    # expect(user.email).not_to
  end

  it 'has a valid password' do
    expect(user.password).to eq('123456')
  end

  it 'is expected to only allow valid users' do
    expect(user).to be_valid
    bad_username = User.new(username: '', email: 'larry@jokeaddress.com', password: '123456')
    bad_email = User.new(username: 'Larry', email: 'larry@jokeaddress', password: '123456')
    bad_password = User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123')
    expect(bad_username).not_to be_valid
    expect(bad_email).not_to be_valid
    expect(bad_password).not_to be_valid
  end
end

# Unit test for users.
require 'rails_helper'
require_relative '../app/models/user'

RSpec.describe User, type: :model do
  before { @user = User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }

  it 'has a username' do
    username = @user.username

    expect(username).to eq('Larry')
  end

  it 'has a valid email address' do
    email = @user.email

    expect(email).to eq('larry@jokeaddress.com')
  end

  it 'has a valid password' do
    password = @user.password

    expect(password).to eq('123456')
  end
end

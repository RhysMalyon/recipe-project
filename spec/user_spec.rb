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
  end

  it 'has a valid password' do
    expect(user.password).to eq('123456')
  end
end

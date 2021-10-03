# Unit test for users.
require 'rails_helper'
require_relative '../app/models/user'

RSpec.describe User, type: :model do
  subject { described_class.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }

  it 'has a username' do
    expect(subject.username).to eq('Larry')
  end

  it 'has a valid email address' do
    expect(subject.email).to eq('larry@jokeaddress.com')
  end

  it 'has a valid password' do
    expect(subject.password).to eq('123456')
  end

  it 'is expected to only allow valid users' do
    expect(subject).to be_valid
    bad_username = described_class.new(username: '', email: 'larry@jokeaddress.com', password: '123456')
    bad_email = described_class.new(username: 'Larry', email: 'larry@jokeaddress', password: '123456')
    bad_password = described_class.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123')
    expect(bad_username).not_to be_valid
    expect(bad_email).not_to be_valid
    expect(bad_password).not_to be_valid
  end
end

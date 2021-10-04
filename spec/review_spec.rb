# Unit test for reviews.
require 'rails_helper'
require_relative '../app/models/review'

RSpec.describe Review, type: :model do
  subject { described_class.new(content: 'It was a good recipe', rating: 4) }
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }
  let(:recipe) { Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }

  it 'has something written' do
    expect(subject.content).to eq('It was a good recipe')
  end

  it 'has a rating' do
    expect(subject.rating).to eq(4)
  end

  it 'is attached to a recipe' do
    subject.recipe = recipe
    expect(subject.recipe).to be(recipe)
  end

  it 'is written by a user' do
    subject.user = user
    expect(subject.user).to be(user)
  end
end

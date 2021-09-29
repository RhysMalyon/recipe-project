# Unit test for reviews.
require 'rails_helper'
require_relative '../app/models/review'

RSpec.describe Review, type: :model do
  let(:review) { Review.new(content: 'It was a good recipe', rating: 4) }
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }
  let(:recipe) { Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }

  it 'has something written' do
    expect(review.content).to eq('It was a good recipe')
  end

  it 'has a rating' do
    expect(review.rating).to eq(4)
  end

  it 'is attached to a recipe' do
    review.recipe = recipe
    expect(review.recipe).to be(recipe)
  end

  it 'is written by a user' do
    review.user = user
    expect(review.user).to be(user)
  end
end

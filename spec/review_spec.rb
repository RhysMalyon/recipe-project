# Unit test for reviews.
require 'rails_helper'
require_relative '../app/models/review'

RSpec.describe Review, type: :model do
  before { @review = Review.new(content: 'It was a good recipe', rating: 4) }

  it 'has something written' do
    content = @review.content
    expect(content).to eq('It was a good recipe')
  end

  it 'has a rating' do
    rating = @review.rating
    expect(rating).to eq(4)
  end

  it 'is attached to a recipe'
  it 'is written by a user'
end

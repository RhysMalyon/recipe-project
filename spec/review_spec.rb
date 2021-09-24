# Unit test for reviews.
require 'rails_helper'
require_relative '../app/models/review'

RSpec.describe Review, type: :model do
  let(:review) { Review.new(content: 'It was a good recipe', rating: 4) }

  it 'has something written' do
    expect(review.content).to eq('It was a good recipe')
  end

  it 'has a rating' do
    expect(review.rating).to eq(4)
  end

  it 'is attached to a recipe'
  it 'is written by a user'
end

# Unit test for bookmarks.
require 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/bookmark'
require_relative '../app/models/recipe'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }
  let(:recipe) { Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }
  subject { described_class.new }

  it 'is created by a user' do
    subject.user = user
    expect(subject.user).to be(user)
  end

  it 'references a recipe' do
    subject.recipe = recipe
    expect(subject.recipe).to be(recipe)
  end

  it 'is only valid if it is attached to a user and a recipe' do
    expect(subject).not_to be_valid
    subject.user = user
    expect(subject).not_to be_valid
    subject.recipe = recipe
    expect(subject).to be_valid
  end
end

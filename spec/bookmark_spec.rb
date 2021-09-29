# Unit test for bookmarks.
require 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/bookmark'
require_relative '../app/models/recipe'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }
  let(:recipe) { Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }
  let(:bookmark) { Bookmark.new }

  it 'is created by a user' do
    bookmark.user = user
    expect(bookmark.user).to be(user)
  end

  it 'references a recipe' do
    bookmark.recipe = recipe
    expect(bookmark.recipe).to be(recipe)
  end

  it 'is only valid if it is attached to a user and a recipe' do
    expect(bookmark).not_to be_valid
    bookmark.user = user
    expect(bookmark).not_to be_valid
    bookmark.recipe = recipe
    expect(bookmark).to be_valid
  end
end

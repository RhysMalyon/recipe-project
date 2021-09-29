# Unit test for recipes.
require 'rails_helper'
require_relative '../app/models/recipe'
require_relative '../app/models/user'

RSpec.describe Recipe, type: :model do
  let(:recipe) { Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }

  it 'has a name' do
    expect(recipe.name).to eq('Green eggs and Ham')
  end

  it 'has a list of ingredients' do
    expect(recipe.ingredients).to eq(%w[eggs ham])
  end

  context 'ingredients' do
    it 'allows ingredients to be added' do
      expect(recipe.ingredients.push('green stuff')).to eq(['eggs', 'ham', 'green stuff'])
    end

    it 'allows ingredients to be removed' do
      recipe.ingredients.pop
      expect(recipe.ingredients).to eq(['eggs'])
    end
  end

  it 'has a prep time' do
    expect(recipe.prep_time).to eq(15)
  end

  it 'has instructions' do
    expect(recipe.instructions).to eq('Crack the eggs, and put in the ham.')
  end

  context 'author' do
    it 'recipe has an author' do
      recipe.user = user
      expect(recipe.user).to be(user)
    end
    it 'recipe is only valid if it has an author' do
      expect(recipe).not_to be_valid
      recipe.user = user
      expect(recipe).to be_valid
    end
  end
end

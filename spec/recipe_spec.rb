# Unit test for recipes.
require 'rails_helper'
require_relative '../app/models/recipe'

RSpec.describe Recipe, type: :model do
  before { @recipe = Recipe.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) } # We declare an instance @recipe that we can reuse in this series of tests, instead of having to create instances for every test.

  it 'has an author' do
    name = @recipe.name

    expect(name).to eq('Green eggs and Ham')
  end

  it 'has a list of ingredients' do
    ingredients = @recipe.ingredients

    expect(ingredients).to eq(%w[eggs ham])
  end

  it 'has a prep time' do
    prep_time = @recipe.prep_time

    expect(prep_time).to eq(15)
  end

  it 'has instructions' do
    instructions = @recipe.instructions

    expect(instructions).to eq('Crack the eggs, and put in the ham.')
  end
end

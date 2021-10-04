# Unit test for recipes.
require 'rails_helper'
require_relative '../app/models/recipe'
require_relative '../app/models/user'

RSpec.describe Recipe, type: :model do
  let(:user) { User.new(username: 'Larry', email: 'larry@jokeaddress.com', password: '123456') }
  subject { described_class.new(name: 'Green eggs and Ham', ingredients: ['eggs', 'ham'], prep_time: 15, instructions: 'Crack the eggs, and put in the ham.', rating: 4) }

  it 'has a name' do
    expect(subject.name).to eq('Green eggs and Ham')
  end

  it 'has a list of ingredients' do
    expect(subject.ingredients).to eq(%w[eggs ham])
  end

  context 'ingredients' do
    it 'allows ingredients to be added' do
      expect(subject.ingredients.push('green stuff')).to eq(['eggs', 'ham', 'green stuff'])
    end

    it 'allows ingredients to be removed' do
      subject.ingredients.pop
      expect(subject.ingredients).to eq(['eggs'])
    end
  end

  it 'has a prep time' do
    expect(subject.prep_time).to eq(15)
  end

  it 'has instructions' do
    expect(subject.instructions).to eq('Crack the eggs, and put in the ham.')
  end

  context 'author' do
    it 'recipe has an author' do
      subject.user = user
      expect(subject.user).to eq(user)
    end
    it 'recipe is only valid if it has an author' do
      expect(subject).not_to be_valid
      subject.user = user
      expect(subject).to be_valid
    end
  end
end

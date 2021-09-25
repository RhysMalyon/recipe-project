require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "First, let's clear our recipes."
Recipe.destroy_all

puts "Now let's clear our users."
User.destroy_all

puts 'DB cleaned'

puts 'Creating Rhys'
User.create!(username: 'Rhys', email: 'rhys@me.com', password: 123456)

puts 'Creating Viddy'
User.create!(username: 'Viddy', email: 'viddy@me.com', password: 123456)

puts "Now to create recipes."
10.times do
  ingredient_list = []
  rand(1..5).times do
    ingredient_list << ingredientsFaker::Food.ingredient
  end
  Recipe.create!(name: Faker::Food.dish, ingredients: ingredient_list, prep_time: rand(1..90), instructions: "Just cook #{['it', 'the recipe', 'your food', 'the full monty'].sample}", user: User.find(rand(1..2)))
end

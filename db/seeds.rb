# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'Faker'

10.times do
  a = Cocktail.create!(name: Faker::GameOfThrones.character)
end

filepath = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
document = open(filepath).read
doc = JSON.parse(document)
drinks = doc["drinks"]
drinks.each do |drink|
  c = Ingredient.create!(name: drink["strIngredient1"])
  p c
end

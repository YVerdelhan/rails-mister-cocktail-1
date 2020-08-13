require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

puts "ingredients creation"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
data = JSON.parse(json)

drinks = data["drinks"]

drinks.each do |drink|
  a = drink["strIngredient1"]
  Ingredient.create!(name: a)
end

puts "ingredient creation done ! I start the cocktails"

cocktails = ("odkeau, Bloody Mary, Russe blanc, Octobre rouge, Russe noir, Screwdriver, Trou noir, Chien enragé, PPP, Sex on the beach, Blue Lagoon, Cosmopolitan").split(",")

cocktails.each do |cocktail|
  Cocktail.create(name: cocktail)
end

puts "cocktail creation done"


# require 'open-uri'
# require 'json'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# puts "creating database..."
# Cocktail.destroy_all
# Ingredient.destroy_all
# Dose.destroy_all
# puts "creating cocktails, ingredients..."

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# user_serialized = open(url).read
# results = JSON.parse(user_serialized)

# results['drinks'].each do |result|
#   Ingredient.create(name: result[:strIngredient1])
#   Dose.create(description: "10cl", cocktail: kaipiroska, ingredient: lemon)
# end

# # lemon = Ingredient.create(name: "lemon")
# # ice = Ingredient.create(name: "ice")
# # vodka = Ingredient.create(name: "vodka")
# # sucre = Ingredient.create(name: "sucre")

# long_island = Cocktail.create(name: "Long Island")
# kaipiroska = Cocktail.create(name: "Kaipiroska")
# sex_on_the_beach = Cocktail.create(name: "Sex on the beach")

# # Dose.create(description: "10cl", cocktail: kaipiroska, ingredient: lemon)
# # Dose.create(description: "50cl", cocktail: kaipiroska, ingredient: vodka)
# # Dose.create(description: "1 carré", cocktail: kaipiroska, ingredient: sucre)
# puts "finish!"


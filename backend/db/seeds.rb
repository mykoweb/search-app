# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.destroy_all
Category.destroy_all

Category.create!([
  { name: 'condiments' },
  { name: 'desserts' },
  { name: 'fruit' },
  { name: 'fungi' },
  { name: 'grains' },
  { name: 'meat' },
  { name: 'seafood' },
  { name: 'vegetables' }
])

condiment = Category.find_by_name 'condiments'
Food.create!([
  { name: 'mango chutney', category: condiment },
  { name: 'ketchup', category: condiment },
  { name: 'mustard', category: condiment },
  { name: 'soy sauce', category: condiment },
  { name: 'sriracha', category: condiment }
])

dessert = Category.find_by_name 'desserts'
Food.create!([
  { name: 'baklava', category: dessert },
  { name: 'brownie', category: dessert },
  { name: 'chocolate cake', category: dessert }
])

fruit = Category.find_by_name 'fruit'
Food.create!([
  { name: 'apple', category: fruit },
  { name: 'banana', category: fruit },
  { name: 'kiwi', category: fruit },
  { name: 'orange', category: fruit },
  { name: 'watermelon', category: fruit }
])

fungi = Category.find_by_name 'fungi'
Food.create!([
  { name: 'chanterelle', category: fungi },
  { name: 'matsutake', category: fungi },
  { name: 'porcini', category: fungi }
])

grains = Category.find_by_name 'grains'
Food.create!([
  { name: 'alfalfa', category: grains },
  { name: 'barley', category: grains },
  { name: 'oats', category: grains },
  { name: 'wheat', category: grains }
])

meat = Category.find_by_name 'meat'
Food.create!([
  { name: 'bacon', category: meat },
  { name: 'beef', category: meat },
  { name: 'chicken', category: meat },
  { name: 'duck', category: meat },
  { name: 'pork', category: meat },
  { name: 'turkey', category: meat }
])

seafood = Category.find_by_name 'seafood'
Food.create!([
  { name: 'clams', category: seafood },
  { name: 'crab', category: seafood },
  { name: 'fish', category: seafood },
  { name: 'lobster', category: seafood },
  { name: 'oyster', category: seafood },
  { name: 'seaweed', category: seafood }
])

vegetables = Category.find_by_name 'vegetables'
Food.create!([
  { name: 'broccoli', category: vegetables },
  { name: 'carrot', category: vegetables },
  { name: 'cauliflower', category: vegetables },
  { name: 'kale', category: vegetables },
  { name: 'spinach', category: vegetables },
  { name: 'turnip', category: vegetables }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  interest_tags = []
  rand(1..4).times do
    tag = ['Chinese Food', 'Asian Food', 'Western Food', 'Alcohol-related', 'Dessert and Coffee'].sample
    interest_tags << tag unless interest_tags.include? tag
  end
  user = User.new(
    name: Faker::FunnyName.two_word_name
    email: Faker::Internet.email
    phone: Faker::PhoneNumber.cell_phone
    description: Faker::StarWars.quote
    interest: interest_tags
    )
  rand(0..5).times do
    meal =  Meal.new(
      name: Faker::Food.dish
      )
  end
end

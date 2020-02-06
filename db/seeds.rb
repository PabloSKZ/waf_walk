# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all
City.destroy_all

race = ['Pitbull', 'Labrador', 'Chihuahua', 'Husky', 'Jack Russel']

100.times do
  city = City.create!(name: Faker::Address.city)
  dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.between(from: 18, to: 70), city: city)
  dog = Dog.create!(name: Faker::Artist.name, race: race[rand(5)], city: city)
  stroll = Stroll.create!(dogsitter: dogsitter, dog: dog)
end
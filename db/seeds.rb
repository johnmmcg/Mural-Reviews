# require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Mural.destroy_all

#
# 5.times do
#   user_params = {
#     username: "#{Faker::StarWars.character}",
#     email: "#{Faker::Internet.email}",
#     password: "password"
#   }
#   User.create(user_params)
# end
#
# 5.times do
#   mural_params = {
#     name: "#{Faker::StarWars.droid}",
#     location: "#{Faker::StarWars.planet}",
#     description: "#{Faker::StarWars.quote}",
#     rating: rand(5)+1,
#     photo_url: "#{Faker::Avatar.image}",
#     user_id: rand(User.first.id...User.last.id)
#   }
#   Mural.create(mural_params)
# end
#
# 10.times do
#   review_params = {
#     user_id: rand(User.first.id...User.last.id),
#     review: "#{Faker::FamilyGuy.quote}",
#     rating: rand(5)+1,
#     mural_id: rand(Mural.first.id...Mural.last.id)
#   }
#   Review.create(review_params)
# end

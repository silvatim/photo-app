# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.destroy_all

u1 = User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 email: Faker::Internet.email, city: Faker::Address.city,
                 country: Faker::Address.country, about: Faker::Lorem.paragraph,
                 image: Faker::Avatar.image, password: "chicken",
                 password_confirmation: "chicken")
u2 = User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 email: Faker::Internet.email, city: Faker::Address.city,
                 country: Faker::Address.country, about: Faker::Lorem.paragraph,
                 image: Faker::Avatar.image, password: "chicken",
                 password_confirmation: "chicken")
u3 = User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 email: Faker::Internet.email, city: Faker::Address.city,
                 country: Faker::Address.country, about: Faker::Lorem.paragraph,
                 image: Faker::Avatar.image, password: "chicken",
                 password_confirmation: "chicken")

puts "User count is #{User.all.count}"

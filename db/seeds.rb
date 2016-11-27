
User.destroy_all

 49.times do |n|
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 email: Faker::Internet.email, city: Faker::Address.city,
                 country: Faker::Address.country, about: Faker::Lorem.paragraph,
                 image: Faker::Avatar.image, password: "chicken",
                 password_confirmation: "chicken")
 end

  User.create!(first_name: "Tim", last_name: "Silva",
              email: "silva.tim@gmail.com", city: "Sydney",
              country: "Australia", about: "I like taking photos",
              image: Faker::Avatar.image, password: "chicken",
              password_confirmation: "chicken")

puts "User count is #{User.all.count}"

# Following relationships
  users = User.all
  user  = users.first
  following = users[2..20]
  followers = users[10..40]
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }

  u = User.find_by(email: "silva.tim@gmail.com")
  following.each { |followed| u.follow(followed) }
  followers.each { |follower| follower.follow(u) }

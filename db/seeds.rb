
User.destroy_all

 49.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               city: Faker::Address.city,
               country: Faker::Address.country,
               about: Faker::Lorem.paragraph,
               image: Faker::Avatar.image,
               password: "chicken",
               password_confirmation: "chicken")
 end

  # User.create!(first_name: "Tim",
  #              last_name: "Silva",
  #              email: "silva.tim@gmail.com",
  #              city: "Sydney",
  #              country: "Australia",
  #              about: Faker::Lorem.paragraph,
  #              image: Faker::Avatar.image,
  #              password: "chicken",
  #              password_confirmation: "chicken")

 puts "User count is #{User.all.count}"

# Following relationships
  users = User.all
  user  = users.first

  following = users[2..20]
  followers = users[10..40]

  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }

  # u1 = User.find_by(email: "silva.tim@gmail.com")
  # following.each { |followed| u1.follow(followed) }
  # followers.each { |follower| follower.follow(u1) }
  #
  # puts "User #{u1.first_name} has #{u1.followers.count} followers"
  # puts "User #{u1.first_name} is following #{u1.following.count} users"

  Gallery.destroy_all
  users = User.all
  3.times do
    gallery = Gallery.create!(title: Faker::Hipster.word,
                              description: Faker::Hipster.sentence,
                              visibility: true)

    users.each { |u| u.galleries << gallery }
  end

  Photo.destroy_all

  galleries = Gallery.all

  10.times do
    photo = Photo.create!(title: Faker::Hipster.word,
                          description: Faker::Hipster.sentence,
                          location: Faker::Address.country,
                          image: Faker::Placeholdit.image)

    galleries.each { |gallery| gallery.photos << photo }
  end


  # puts "User #{u1.first_name} has #{u1.galleries.count} galleries and #{u1.photos.count} photos"
  puts "User #{User.first.first_name} has #{User.first.galleries.count} galleries and #{User.first.photos.count} photos"







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

  User.create!(first_name: "Tim",
               last_name: "Silva",
               email: "silva.tim@gmail.com",
               city: "Sydney",
               country: "Australia",
               about: Faker::Lorem.paragraph,
               image: Faker::Avatar.image("50x50"),
               password: "chicken",
               password_confirmation: "chicken")

 puts "User count is #{User.all.count}"

# Following relationships
  users = User.all
  user  = users.first

  following = users[2..20]
  followers = users[10..40]

  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }

  u1 = User.find_by(email: "silva.tim@gmail.com")
  following.each { |followed| u1.follow(followed) }
  followers.each { |follower| follower.follow(u1) }

  puts "User #{u1.first_name} has #{u1.followers.count} followers"
  puts "User #{u1.first_name} is following #{u1.following.count} users"

  Gallery.destroy_all
  Photo.destroy_all
  users = User.all
  categories = ["Abstract", "Animals", "Black & White", "Celebrities", "Architecture", "Commercial",
                "Concert", "Family", "Fashion", "Film", "Fine Art", "Food", "Journalism", "Landscape",
                "Macro", "Nature", "People", "Performing Arts", "Sport", "Still Life", "Street",
                "Transportation", "Travel", "Underwater", "Wedding"]

  Category.destroy_all

  categories.each do |c|
    Category.create!(name: c)
  end


  users.each do |u|
    g1 = Gallery.create!(title: Faker::Hipster.word,
                              description: Faker::Hipster.sentence,
                              visibility: true)
    g2 = Gallery.create!(title: Faker::Hipster.word,
                              description: Faker::Hipster.sentence,
                              visibility: true)
    g3 = Gallery.create!(title: Faker::Hipster.word,
                              description: Faker::Hipster.sentence,
                              visibility: true)
  5.times do
    photo = Photo.create!(title: Faker::Hipster.word,
                          description: Faker::Hipster.sentence,
                          location: Faker::Address.country,
                          category_id: Category.pluck(:id).sample,
                          image: Faker::Placeholdit.image,
                          user_id: u.id)
    g1.photos << photo
    g2.photos << photo
    g3.photos << photo

   end

  u.galleries << g1 << g2 << g3

 end

  puts "User #{u1.first_name} has #{u1.galleries.count} galleries and #{u1.photos.count} photos"
  puts "User #{User.first.first_name} has #{User.first.galleries.count} galleries and #{User.first.photos.count} photos"

  puts "The number of photo categories is #{Category.all.count}"

  puts "The first photo has a category of: #{Photo.first.category.name}"
  puts "Category #{Category.first.name} has #{Category.first.photos.count} photos"

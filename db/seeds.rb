# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
City.destroy_all
User.destroy_all

#Users 
users_data = []
10.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  users_data << {
    first_name: first,
    last_name: last,
    home_city: FFaker::Address.city, 
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: "abc123"
  }
end
users = User.create(users_data)

#cities 
cities_data = []
6.times do
  cities_data << {
    name: FFaker::Address.city, 
  }
end
cities = City.create(cities_data)

#posts
posts_data = []
6.times do
  posts_data << {
    title: FFaker::Lorem.word, 
    content: FFaker::Lorem.phrase, 
    user: users.sample, 
    city: cities.sample
  }
end
posts = Post.create(posts_data)


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
    password: "abc123", 
    image: "https://images.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fn7WzKaAEn0c%2Fmaxresdefault.jpg&f=1"
  }
end
users = User.create(users_data)

#cities 
cities_data = [{name:"San Francisco", image:"https://cdn.vox-cdn.com/thumbor/nkA0OYFOejA96gXee5DQG9RZVFk=/0x0:1368x912/1200x800/filters:focal(575x347:793x565)/cdn.vox-cdn.com/uploads/chorus_image/image/55144679/Pius_Lee.0.jpg"}, 
  {name:"Atlanta", image: "https://www.ntsecurityllc.com/wp-content/uploads/2013/09/city-of-atlanta.png" },
  {name:"New York", image:"https://cdn.getyourguide.com/img/location_img-59-1224772867-148.jpg"},
  {name:"Chicago", image:"http://www.billslater.com/cloudgate/cloudgate_blackhawks_2013_0625_.jpg"}]
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


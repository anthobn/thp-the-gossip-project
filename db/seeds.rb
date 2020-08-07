# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Gossip.destroy_all
City.destroy_all
Comment.destroy_all

50.times do |x|
  city = City.create!(name: Faker::Address.city, zip_code: rand(10000..70000))
end

100.times do |x|
  user = User.create!(first_name: Faker::Name.first_name, family_name: Faker::Name.last_name, mail: Faker::Internet.email, city_id: City.all.sample.id, description: Faker::Lorem.paragraph_by_chars(number: 20, supplemental: false), age: rand(10..99), password: "strongPass")
end

200.times do |x|
  gossip = Gossip.create!(title: Faker::Lorem.paragraph_by_chars(number: 12, supplemental: false), content: Faker::Lorem.paragraph_by_chars(number: 80, supplemental: false), user_id: User.all.sample.id)
end

400.times do |x|
  comment = Comment.create!(content: Faker::Lorem.paragraph_by_chars(number: 80, supplemental: false), user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end

User.create!(first_name: 'Anonymous', family_name: 'Anonymous', mail: 'anonymous@anonymous.com', city_id: City.all.sample.id, description: Faker::Lorem.paragraph_by_chars(number: 20, supplemental: false), age: rand(10..99), password: "strongPass")
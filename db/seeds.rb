# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Gossip.destroy_all

100.times do |x|
  user = User.create!(first_name: Faker::Name.first_name, family_name: Faker::Name.last_name, mail: Faker::Internet.email)
end

200.times do |x|
  gossip = Gossip.create!(title: Faker::Lorem.paragraph_by_chars(number: 12, supplemental: false), content: Faker::Lorem.paragraph_by_chars(number: 80, supplemental: false), user_id: User.all.sample.id)
end

User.create!(first_name: 'Anonymous', family_name: 'Anonymous', mail: 'anonymous@anonymous.com')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts 'Creating boats...'
10.times do |_variable|
  Boat.create!(
  	name: Faker::Name.name,
  	description: Faker::Lorem.sentence,
  	location: Faker::Address.city,
  	price_per_day: Faker::Commerce.price,
  	user_id: 1
  )
end

puts 'Finished!'
require "json"
require "open-uri"
require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
puts 'Database cleaned'

random_id_hero = rand(1..731)
url = "https://superheroapi.com/api/10229599919482949/"
10.times do
  puts "Importing 10 random heroes"
  buddies = JSON.parse(URI.open("#{url}#{random_id_hero}").read)
  buddies.each do |buddy|
    puts "Creating #{buddy['name']}"
    User.create(
      name: buddy['name'],
      description: buddy['connections'].first,
      photo: photo.attach(io: buddy['image'].first, filename: "#{buddy['name']}.png", content_type: "image/png"),
      email: Faker::Internet.free_email
    )
    puts "Created #{buddy['name']}"
  end
end
puts 'Finished!'

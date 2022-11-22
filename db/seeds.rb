require "json"
require "open-uri"

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

url = "https://www.superheroapi.com/api.php/10229599919482949/"
10.times do
  puts "Importing 10 random heroes"
  random_id_hero = rand(1..731).to_i
  buddies = JSON.parse(URI.open("#{url}#{random_id_hero}").read)
  puts "Creating #{buddies['name']}"
  User.create(
    name: buddies['name'],
    description: buddies['connections'].first,
    # photo: photo.attach(io: buddies['image'].first, filename: "#{buddies['name']}.png", content_type: "image/png"),
    email: "email#{random_id_hero}@mail.com"
  )
  puts "Created #{buddies['name']}"
end
puts 'Finished!'

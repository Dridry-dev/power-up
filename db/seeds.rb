require "json"
require "open-uri"

puts 'Cleaning database...'
User.destroy_all
Prestation.destroy_all
puts 'Database cleaned'

url = "https://www.superheroapi.com/api.php/10229599919482949/"
puts "Importing 10 random heroes"
10.times do
  random_id_hero = rand(1..731).to_i
  buddies = JSON.parse(URI.open("#{url}#{random_id_hero}").read)
  puts "Creating #{buddies['name']}"
  User.create!(
    name: buddies['name'],
    description: buddies['connections'].first,
    # photo: photo.attach(io: buddies['image'].first, filename: "#{buddies['name']}.png", content_type: "image/png"),
    email: "mail#{random_id_hero}@mail.com",
    password: "azerty"
  )
  puts "Created some prestations"
end
User.create!(
  name: "bonjour",
  description: "C'est une super description que voilà",
  # photo: photo.attach(io: buddies['image'].first, filename: "#{buddies['name']}.png", content_type: "image/png"),
  email: "mail@mail.com",
  password: "azerty"
)

puts "Importing une prestations"
Prestation.create!(
  name: "Solo de Trompette",
  description: "Pouet Pouet Pouet Pouet Pouet Pouet",
  price: 9.99,
  user_id: User.last.id
)
puts "Created one prestation"
puts 'Finished!'

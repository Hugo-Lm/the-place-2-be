# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destruction des données en bdd"
  Comment.destroy_all
  User.destroy_all
  Place.destroy_all
  Category.destroy_all
  District.destroy_all
puts "données détruites"

puts "Initialisation du seed"

puts "Création des utilisateurs"
  user1 = User.create!(
    name: "Hugo",
    email: "hugo@gmail.com",
    password: "abcdef",
    current_year: 3,
    description: "En provencance de Tahiti, j'aime les pigeons, la brioche et les cartes Yu-Gy-Oh",
    insta_name: "hugo_lm__"
    )

  user2 = User.create!(
    name: "Julie",
    email: "julie@gmail.com",
    password: "abcdef",
    current_year: 1,
    description: "Une future pro de la comm', j'aspire à révolutionner la scène bordelaise",
    insta_name: "julie_lmv"
    )
puts "Utilisateurs créés!"

puts "Création des catégories de lieux"
  category1 = Category.create!(
    name: "Bar à tapas"
    )
  category2 = Category.create!(
    name: "Boite de nuit"
    )
  category3 = Category.create!(
    name: "Restaurant"
    )
  category4 = Category.create!(
    name: "Fast-Food"
    )
puts "Catégories de lieux créés!"


puts "Création des quartiers"
  district1 = District.create!(
    name: "Centre"
    )
  district2 = District.create!(
    name: "Saint-Michel"
    )
  district3 = District.create!(
    name: "Chartrons"
    )
puts "Quartiers créés!"




puts "Création des spots"
10.times do
  Place.create!(
    name: Faker::Restaurant.name ,
    price_level: rand(1..3),
    category: Category.all.sample,
    district: District.all.sample,
    address: Faker::Address.street_address
    )
end
puts "Spots créés!"

puts "Création des commentaires"
10.times do
  Comment.create!(
    user: User.all.sample,
    place: Place.all.sample,
    description: Faker::Movies::StarWars.quote,
    rating: rand(1..5)
    )
end
puts "Commentaires créés"

puts "Seed réussi :)"

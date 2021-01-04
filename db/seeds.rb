# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  place1 = Place.create!(
    name: "Allo de rose",
    price_level: 2,
    category: category3,
    district: district1,
    address: "12 rue de la Merci, Bordeaux"
    )
  place2 = Place.create!(
    name: "Le Comptoir de Tutelle",
    price_level: 3,
    category: category1,
    district: district1,
    address: "20 rue Pilliers de Tutelle, Bordeaux"
    )
puts "Spots créés!"

puts "Création des commentaires"
  Comment.create!(
    user: user1,
    place: place1,
    description: "Top top top!",
    rating: 5
    )
  Comment.create!(
    user: user2,
    place: place1,
    description: "Bof.",
    rating: 2
    )
  Comment.create!(
    user: user2,
    place: place2,
    description: "Whoaw, super endroit!",
    rating: 4
    )
puts "Commentaires créés"

puts "Seed réussi :)"




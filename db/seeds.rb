# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

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
  category5 = Category.create!(
    name: "Bar"
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
    name: "Le Comptoir de Tutelles",
    price_level: 2,
    category: Category.find_by(name: "Bar à tapas"),
    district: District.find_by(name: "Centre"),
    address: "20 Rue des Piliers de Tutelle, 33000 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipNYyo0w2XsVQmL8GQDCuNJwFhDWHJchV4nJQorM=w408-h271-k-no')
  place1.photo.attach(io: file, filename: 'place1.jpg', content_type: 'image/jpeg')

place2 = Place.create!(
    name: "Bodega Bodega",
    price_level: 1,
    category: Category.find_by(name: "Restaurant"),
    district: District.find_by(name: "Centre"),
    address: "4 Rue des Piliers de Tutelle, 33000 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipPV8rTSWgdKEiVjBpq_nM8qVvgkjNyeiQuVIXbS=w408-h306-k-no')
  place2.photo.attach(io: file, filename: 'place2.jpg', content_type: 'image/jpeg')

place3 = Place.create!(
    name: "L'Empire Bordeaux",
    price_level: 2,
    category: Category.find_by(name: "Boite de nuit"),
    district: District.find_by(name: "Centre"),
    address: "14 Rue de la Devise, 33000 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipPHJAt0rNKIOt3JG-1drjx-6nj57dxtxgL0wAot=w408-h272-k-no')
  place3.photo.attach(io: file, filename: 'place3.jpg', content_type: 'image/jpeg')

place4 = Place.create!(
    name: "Le Wine Bar",
    price_level: 3,
    category: Category.find_by(name: "Bar"),
    district: District.find_by(name: "Centre"),
    address: "19 Rue des Bahutiers, 33000 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipOG-s3sB8-nbAKuYMgicqyB65t68G-iz3vsxUfd=w408-h270-k-no')
  place4.photo.attach(io: file, filename: 'place4.jpg', content_type: 'image/jpeg')

place5 = Place.create!(
    name: "King-Kong Bar",
    price_level: 1,
    category: Category.find_by(name: "Bar"),
    district: District.find_by(name: "Chartrons"),
    address: "72 Quai des Chartrons, 33300 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipPyF3sBXmfW5EXs4DGl-uc0rU8NjfryeNTQPbP4=w426-h240-k-no')
  place5.photo.attach(io: file, filename: 'place5.jpg', content_type: 'image/jpeg')

place6 = Place.create!(
    name: "Aux p'tits comptoirs",
    price_level: 2,
    category: Category.find_by(name: "Bar"),
    district: District.find_by(name: "Chartrons"),
    address: "15 Place Paul Doumer, 33000 Bordeaux"
    )
  file = URI.open('https://lh5.googleusercontent.com/p/AF1QipPAJ5FmitEL_5xH8uLZCgJnamvN24H-NbJJx6i8=w408-h544-k-no')
  place6.photo.attach(io: file, filename: 'place6.jpg', content_type: 'image/jpeg')

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

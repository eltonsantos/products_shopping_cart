# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create id: 1, name: "Guns n' Roses", description: "Greatest Hits", quantity: 10, price: 200, image: File.new("public/images/gunsnroses.jpg")
Product.create id: 2, name: "Legião Urbana", description: "Top in the club", quantity: 3, price: 150, image: File.new("public/images/legiaourbana.jpg")

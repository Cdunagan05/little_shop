# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
item = Item.create(title: 'Texas Jersey', description: 'This is a sweet Longhorn Jersey yo', price: 100.00)
item.categories.create(name: 'Jerseys')
item.categories.create(name: 'Texas')
Category.create(name: 'Va Tech')

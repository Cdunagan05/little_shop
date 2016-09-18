# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: 'a', password: 'b')
item1 = Item.create(title: 'Texas Jersey', description: 'This is a sweet Longhorn Jersey yo', price: 100.00)
item2 = Item.create(title: 'Virginia Tech Jersey', description: 'This is a sweet Hokies Jersey yo', price: 125.00)
jersys = Category.create(name: 'Jerseys')
item1.categories<<(jersys)
item1.categories.create(name: 'Texas')
item2.categories.create(name: 'Va Tech')
item2.categories<<(jersys)
user.orders.new
user.orders.first.items<<([item1, item2])
user.orders.first.save
user.orders.first.order_items.where(item_id: item1.id).first.update_attribute(:subtotal, 500.0)
user.orders.first.order_items.where(item_id: item2.id).first.update_attribute(:subtotal, 375.0)
User.create(username:'admin', password:'password', role: 1)

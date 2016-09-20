# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: 'a', password: 'b', name: 'A', address: '123 Fake St')

item1 = Item.create(title: 'Texas Jersey', description: 'This is a sweet Longhorn Jersey yo', price: 100.00, image: 'http://images.footballfanatics.com/FFImage/thumb.aspx?i=/productImages/_2103000/ff_2103501_xl.jpg&w=245')
item2 = Item.create(title: 'Virginia Tech Jersey', description: 'This is a sweet Hokies Jersey yo', price: 125.00, image: 'http://images.footballfanatics.com/FFImage/thumb.aspx?i=/productImages/_1163000/ff_1163469_xl.jpg&w=245')
item3 = Item.create(title: 'Texas Water Bottle', description: 'This is Bevos favorite thing to drink out of', price: 10.00, image: 'http://scene7.targetimg1.com/is/image/Target/13563000?wid=450&hei=450&fmt=pjpeg')
item4 = Item.create(title: 'Virginia Tech Water Bottle', description: 'This is Beamers favorite thing to drink out of', price: 10.00, image: 'http://s7d9.scene7.com/is/image/BedBathandBeyond/23541740299693p')

jerseys = Category.create(name: 'Jerseys')
water_bottle = Category.create(name: 'Water Bottle')
texas = Category.create(name: 'Texas')
va_tech = Category.create(name: 'Va Tech')

item1.categories<<([jerseys, texas])
item2.categories<<([jerseys, va_tech])
item3.categories<<([water_bottle, texas])
item4.categories<<([water_bottle, va_tech])

order = user.orders.new
order.subtotal_order_items({item1 => 5, item2 => 3})
order.save
User.create(username:'admin', password:'password', role: 1, name: 'Govenator', address: '1 Power Tr')

order2 = user.orders.new
order2.subtotal_order_items({item3 => 5, item4 => 3})
order2.save

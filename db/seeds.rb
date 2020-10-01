# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Inventory.destroy_all
Purchase.destroy_all
Store.destroy_all
Customer.destroy_all
Product.destroy_all

coin_flip = ["Repo","Branch","Branch"] #2/3 of the time, our product is a branch. 1/3 of the time, it's a repo.

10.times do
    first_name = Faker::Name.first_name
    name = first_name + " " + Faker::Name.last_name
    Product.create(name: first_name + "'s " + coin_flip.sample, type_of_product: name, price: rand(1..30))
end

target = Store.create(name: "TarGit", type_of_store: "Grocery", manager_code: "test")
Product.all.each do |product|
    Inventory.create(store_id: target[:id], product_id: product.id, quantity: rand(1..10))
end

10.times do
    customer = Customer.create(name: Faker::Name.first_name, birth_year: rand(1950..2000), balance: rand(42..173), password: Faker::Games::Pokemon.name)
end

#DEBUG USER - conrad is manager. password is password
Customer.create(name: "Conrad", birth_year: 1995, balance: 100, password: "password", manager_of_store_id: target[:id])

#DEBUG PRODUCT - way too expensive!
p = Product.create(name: "Expensive Repo", type_of_product: "Debugging to make sure users can't buy out of their price range", price: 1000)
Inventory.create(store_id: target[:id], product_id: p[:id], quantity: 100)

#DEBUG PRODUCT - not in stores
Product.create(name: "Secret Branch", type_of_product: "Not in TarGit after seeding", price: 2)




#Purchase: customer, product, inventory (store, price)
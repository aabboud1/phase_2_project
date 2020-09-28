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

10.times do
    Product.create(name: Faker::Cannabis.strain, type_of_product: Faker::Cannabis.brand, price: rand(1..30))
end

target = Store.create(name: "Target", type_of_store: "Grocery")
Product.all.each do |product|
    Inventory.create(store_id: target[:id], product_id: product.id, quantity: rand(1..10))
end

10.times do
    customer = Customer.create(name: Faker::Name.first_name, birth_year: rand(1950..2000))
    2.times do
        Purchase.create(customer_id: customer[:id], product_id: Product.all.sample[:id], store_id: Store.first.id)
    end
end




#Purchase: customer, product, inventory (store, price)
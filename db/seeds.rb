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
    Customer.create(name: Faker::Name.first_name, birth_year: [1950..2000].sample)
end

target = Store.create(name: "Target", type_of_store: "Grocery")

10.times do
    Product.create(name: Faker::Cannabis.strain, type_of_product: Faker::Cannabis.brand)
end
class Store < ApplicationRecord
    has_many :inventories
    has_many :products, through: :inventories

    has_many :purchases
    has_many :customers, through: :purchases
end

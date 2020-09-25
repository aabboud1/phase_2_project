class Product < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_many :inventories
    has_many :stores, through: :inventories
end

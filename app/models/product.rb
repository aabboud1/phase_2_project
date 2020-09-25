class Product < ApplicationRecord
    has_many :purchases
    has_many :customers, through: :purchases

    has_many :inventories
    has_many :stores, through: :inventories

    validates :name, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 0, message: "- Price must be a positive number."}
end

class Customer < ApplicationRecord
    has_many :purchases
    has_many :products, through: :purchases
    has_many :stores, through: :purchases
end

class Customer < ApplicationRecord
    has_many :purchases
    has_many :products, through: :purchases
    has_many :stores, through: :purchases

    validates :name, presence: true, uniqueness: true
    validates :birth_year, presence: true
    validates :balance, presence: true

    def age
        
    end
end

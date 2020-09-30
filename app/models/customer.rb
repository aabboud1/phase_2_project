class Customer < ApplicationRecord
    has_secure_password
    
    has_many :purchases
    has_many :products, through: :purchases
    has_many :stores, through: :purchases

    validates :name, presence: true, uniqueness: true
    validates :birth_year, presence: true
    validates :balance, presence: true
    #DO NOT VALIDATES PASSWORD

    def age
        
    end

    def make_purchase(price)
        self.balance -= price
        self.save
    end
end

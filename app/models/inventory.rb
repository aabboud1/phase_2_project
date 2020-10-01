class Inventory < ApplicationRecord
    belongs_to :store
    belongs_to :product

    has_many :purchases

    validates :quantity, presence: true
    

    def increase_quantity(amount) #maybe add in a positive number check - shouldn't be able to increase_stock by negative numbers. i mean, or make amount absolute value
            self.update(quantity: self[:quantity] + amount)
    end

    def decrease_quantity(amount = 1) #same as above, shouldn't be able to decrease by negative numbers
        if (self[:quantity] - amount) >= 0
            self.update(quantity: self[:quantity] - 1)
        else
            return false
        end
    end
end

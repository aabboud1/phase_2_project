class Inventory < ApplicationRecord
    belongs_to :store
    belongs_to :product

    has_many :purchases

    def increase_quantity(amount = 1) #maybe add in a positive number check - shouldn't be able to increase_stock by negative numbers. i mean, or make amount absolute value
        self.quantity += amount
        self.update
    end

    def decrease_quantity(amount = 1) #same as above, shouldn't be able to decrease by negative numbers
        if (self[:quantity] - amount) >= 0
            self.update(quantity: self[:quantity] - 1)
        else
            return false
        end
    end
end

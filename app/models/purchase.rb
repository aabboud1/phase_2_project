class Purchase < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    belongs_to :store
end

class Purchase < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    belongs_to :store

    validates :product_id, presence: true
    validates :customer_id, presence: true
    validates :store_id, presence: true
end

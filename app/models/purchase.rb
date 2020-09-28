class Purchase < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    belongs_to :store

    # validates :product_id, presence: true
    # validates :customer_id, presence: true
    # validates :store_id, presence: true

    def print_time
        "#{find_month_name(self.created_at.month)} #{self.created_at.day}, #{self.created_at.year}"
    end

    private
    def find_month_name(month)
        case month
            when 1
                "January"
            when 2
                "February"
            when 3
                "March"
            when 4
                "April"
            when 5
                "May"
            when 6
                "June"
            when 7
                "July"
            when 8
                "August"
            when 9
                "September"
            when 10
                "October"
            when 11
                "November"
            when 12
                "December"
            else
                false
        end
    end
end

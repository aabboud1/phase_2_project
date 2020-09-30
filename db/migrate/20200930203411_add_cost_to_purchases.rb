class AddCostToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :cost, :integer
  end
end

class ChangeDataTypeForPriceAndCost < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :float
    change_column :purchases, :cost, :float
  end
end

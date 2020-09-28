class AddBalanceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :balance, :float
  end
end

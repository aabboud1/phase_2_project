class AddManagerCodeToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :manager_code, :string
    add_column :customers, :manager_of_store_id, :string
  end
end

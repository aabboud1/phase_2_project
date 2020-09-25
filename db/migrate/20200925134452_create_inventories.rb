class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :quantity
      t.belongs_to :store
      t.belongs_to :product

      t.timestamps
    end
  end
end

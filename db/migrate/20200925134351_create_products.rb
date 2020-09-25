class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type_of_product
      t.integer :price

      t.timestamps
    end
  end
end

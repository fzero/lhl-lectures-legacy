class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity_in_stock
      t.references :category

      t.timestamps null: false
    end
  end
end

class CreateProductsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :products_tags, id: false do |t|
      t.references :product
      t.references :tag

      t.timestamps null: false
    end
  end
end

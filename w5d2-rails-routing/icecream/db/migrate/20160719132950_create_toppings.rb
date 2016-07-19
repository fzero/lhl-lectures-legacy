class CreateToppings < ActiveRecord::Migration[5.0]
  def change
    create_table :toppings do |t|
      t.string :type
      t.string :flavour
      t.references :ice_cream, foreign_key: true

      t.timestamps
    end
  end
end

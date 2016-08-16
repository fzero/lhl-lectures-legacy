class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :comments
      t.references :parking_lot, foreign_key: true

      t.timestamps
    end
  end
end

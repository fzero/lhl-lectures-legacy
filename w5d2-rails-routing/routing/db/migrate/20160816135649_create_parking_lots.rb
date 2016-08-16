class CreateParkingLots < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_lots do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :size
      t.float :price
      t.integer :rating

      t.timestamps
    end
  end
end

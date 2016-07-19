class FixStupidTypo < ActiveRecord::Migration[5.0]
  def change
    rename_column :toppings, :toppings_type, :topping_type
  end
end

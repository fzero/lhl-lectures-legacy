class RenameTypeColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :ice_creams, :type, :ice_cream_type
    rename_column :toppings, :type, :toppings_type
  end
end

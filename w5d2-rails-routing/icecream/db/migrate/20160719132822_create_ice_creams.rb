class CreateIceCreams < ActiveRecord::Migration[5.0]
  def change
    create_table :ice_creams do |t|
      t.string :flavour
      t.string :size
      t.string :type
      t.string :cone

      t.timestamps
    end
  end
end

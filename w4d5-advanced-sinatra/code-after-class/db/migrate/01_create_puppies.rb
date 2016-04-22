class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.string :name
      t.string :breed
      t.date :birthday
      t.string :photo_url
      t.integer :cuteness_level
      t.timestamps
    end
  end
end

class CreateUsersAndTunes < ActiveRecord::Migration

  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps null: false
    end

    create_table :tunes do |t|
      t.references :user
      t.string :title
      t.string :artist
      t.string :url
      t.text :comments
      t.timestamps null: false
    end

  end

end

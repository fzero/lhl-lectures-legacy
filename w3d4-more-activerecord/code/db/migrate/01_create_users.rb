class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :admin, :boolean
      t.timestamps null: false
    end
  end

end

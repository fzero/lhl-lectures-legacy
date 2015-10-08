class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.references :post
      t.column :body, :string
      t.column :published, :boolean
      t.timestamps null: false
    end
  end

end

class CreateClowns < ActiveRecord::Migration
	def change
		create_table :clowns do |t|
			t.string :name
			t.string :hair
			t.string :gimmick
			t.timestamps
		end
	end
end

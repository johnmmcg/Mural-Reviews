class CreateMurals < ActiveRecord::Migration[5.0]
  def change
    create_table :murals do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.integer :average_rating, null: false
      t.string :photo_url, null: false 

      t.timestamps
    end
  end
end

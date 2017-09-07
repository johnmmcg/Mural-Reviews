class AddDescriptionToMurals < ActiveRecord::Migration[5.0]
  def change
    add_column :murals, :description, :text, null: false
  end
end

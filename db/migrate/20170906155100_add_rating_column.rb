class AddRatingColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :murals, :rating, :integer, null: false
  end
end

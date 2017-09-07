class RemoveAverageRating < ActiveRecord::Migration[5.0]
  def change
    remove_column :murals, :average_rating
    add_column :murals, :average_rating, :integer
  end
end

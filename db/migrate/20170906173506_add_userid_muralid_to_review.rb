class AddUseridMuralidToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer, null: false
    add_column :reviews, :mural_id, :integer, null: false
  end
end

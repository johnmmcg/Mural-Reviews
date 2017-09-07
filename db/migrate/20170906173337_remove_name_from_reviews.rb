class RemoveNameFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :name
  end
end
